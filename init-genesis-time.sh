#!/bin/bash
GENESIS=$(date +%s)
DELAY_TIME=120

SHANGHAI=$(($GENESIS + $DELAY_TIME))

sed -i -e "s/\"shanghaiTime\": [0-9]*/\"shanghaiTime\": $SHANGHAI/" ./config/genesis.json
sed -i -e "s/\"cancunTime\": [0-9]*/\"cancunTime\": $SHANGHAI/" ./config/genesis.json
sed -i -e "s/GENESIS_TIMESTAMP=[0-9]*/GENESIS_TIMESTAMP=$SHANGHAI/" ./genesis-generator/values.env

echo "Setting shanghaiTime to $SHANGHAI (delay from now + $DELAY_TIME)"
echo "Setting genesisTime to $SHANGHAI"