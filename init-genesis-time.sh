#!/bin/bash
GENESIS=$(date +%s)
DELAY_TIME=180
TTD=140

SHANGHAI=$(($GENESIS + $DELAY_TIME))
CANCUN=$(($GENESIS + 100000))

sed -i -e "s/\"shanghaiTime\": [0-9]*/\"shanghaiTime\": $SHANGHAI/" ./config/genesis.json
sed -i -e "s/\"cancunTime\": [0-9]*/\"cancunTime\": $CANCUN/" ./config/genesis.json
sed -i -e "s/\"terminalTotalDifficulty\": [0-9]*/\"terminalTotalDifficulty\": $TTD/" ./config/genesis.json
sed -i -e "s/GENESIS_TIMESTAMP=[0-9]*/GENESIS_TIMESTAMP=$SHANGHAI/" ./genesis-generator/values.env

echo "Setting shanghaiTime to $SHANGHAI (delay from now + $DELAY_TIME)"
echo "Setting genesisTime to $SHANGHAI"