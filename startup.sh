#!/bin/bash

# cleanup
./geth-stop.sh
./beacon-validator-stop.sh
./clean.sh

# init and start EL
./init-genesis-time.sh
./geth-start.sh

# calculate the difference in seconds to TTD
target_timestamp=$(cat ./ttd_time.txt)
current_timestamp=$(date +%s)
difference=$(($target_timestamp - current_timestamp))
echo "Waiting for EL to reach TTD... ($difference)"
if [ $difference -gt 0 ]; then
    sleep $difference
fi

# shadow fork, generate genesis.ssz and start beacon chain
./shadow-fork.sh
./beacon-validator-start.sh