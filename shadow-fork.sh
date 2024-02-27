curl -H "Content-Type: application/json" \
  --data-raw '{ "jsonrpc":"2.0","method":"eth_getBlockByNumber", "params":[ "latest", true ], "id":1 }' \
  localhost:8545 > ./genesis-generator/el/latest_block.json

rm -rf output && mkdir output

docker run --rm -it -u $UID -v $PWD/output:/data \
  -v $PWD/genesis-generator:/config \
  ethereum-genesis-generator:latest all

cp ./output/custom_config_data/boot_enr.txt \
  ./output/custom_config_data/bootstrap_nodes.txt \
  ./output/custom_config_data/chainspec.json \
  ./output/custom_config_data/config.yaml \
  ./output/custom_config_data/deploy_block.txt \
  ./output/custom_config_data/deposit_contract_block_hash.txt \
  ./output/custom_config_data/deposit_contract_block.txt \
  ./output/custom_config_data/deposit_contract.txt \
  ./output/custom_config_data/genesis_validators_root.txt \
  ./output/custom_config_data/genesis.ssz \
  ./output/custom_config_data/parsedBeaconState.json \
  ./output/custom_config_data/tranches/tranche_0000.txt \
  ./config/
