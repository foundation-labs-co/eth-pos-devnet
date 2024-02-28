#!/bin/bash
EL_BLOCK_TIME=4     # clique block time
EL_TTD=20           # clique block target = TTD/2
EL_DELAY=60         # delay for startup CL

CL_SLOT_PER_EPOCH=32
CL_SLOT_TIME=4
CL_DENEB_FORK_EPOCH=2

GENESIS=$(date +%s)
TTD_TIME=$((($EL_TTD / 2) * $EL_BLOCK_TIME))
SHANGHAI_DELAY=$(($TTD_TIME + $EL_DELAY))
SHANGHAI=$(($GENESIS + $SHANGHAI_DELAY))

DENEB_FORK_SLOT=$(($CL_SLOT_PER_EPOCH * $CL_DENEB_FORK_EPOCH))
DENEB_FORK_EPOCH_TIME=$(($DENEB_FORK_SLOT * $CL_SLOT_TIME))
CANCUN_DELAY=$(($SHANGHAI_DELAY + $DENEB_FORK_EPOCH_TIME))
CANCUN=$(($GENESIS + $CANCUN_DELAY))

sed -i -e "s/\"shanghaiTime\": [0-9]*/\"shanghaiTime\": $SHANGHAI/" ./config/genesis.json
sed -i -e "s/\"cancunTime\": [0-9]*/\"cancunTime\": $CANCUN/" ./config/genesis.json
sed -i -e "s/\"terminalTotalDifficulty\": [0-9]*/\"terminalTotalDifficulty\": $EL_TTD/" ./config/genesis.json
sed -i -e "s/GENESIS_TIMESTAMP=[0-9]*/GENESIS_TIMESTAMP=$SHANGHAI/" ./genesis-generator/values.env
sed -i -e "s/SLOTS_PER_EPOCH=\".*\"/SLOTS_PER_EPOCH=\"$CL_SLOT_PER_EPOCH\"/" ./genesis-generator/values.env
sed -i -e "s/SLOT_DURATION_IN_SECONDS=\".*\"/SLOT_DURATION_IN_SECONDS=\"$CL_SLOT_TIME\"/" ./genesis-generator/values.env
sed -i -e "s/DENEB_FORK_EPOCH=\".*\"/DENEB_FORK_EPOCH=\"$CL_DENEB_FORK_EPOCH\"/" ./genesis-generator/values.env

echo "Setting genesis.json => shanghaiTime to $SHANGHAI (delay from now + $SHANGHAI_DELAY)"
echo "Setting genesis.json => cancunTime to $CANCUN (delay from now + $CANCUN_DELAY, epoch $CL_DENEB_FORK_EPOCH, slot $DENEB_FORK_SLOT)"
echo "Setting config.yaml => genesisTime to $SHANGHAI"

# Export variable
echo $(($GENESIS + $TTD_TIME)) > ./ttd_time.txt