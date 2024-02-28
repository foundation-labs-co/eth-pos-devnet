cd deploy-contracts

yarn
yarn deploy > deploy_output.txt

deploy_address=$(grep 'DEPOSIT_CONTRACT_ADDRESS: ' ./deploy_output.txt | awk '{print $2}')
deploy_block=$(grep 'DEPOSIT_BLOCK_NUMBER: ' ./deploy_output.txt | awk '{print $2}')

echo "Deposit contract: $deploy_address"
echo "Deposit block number: $deploy_block"

sed -i -e "s|DEPOSIT_CONTRACT_ADDRESS=\".*\"|DEPOSIT_CONTRACT_ADDRESS=\"$deploy_address\"|" ../genesis-generator/values.env
sed -i -e "s|CL_EXEC_BLOCK=\".*\"|CL_EXEC_BLOCK=\"$deploy_block\"|" ../genesis-generator/values.env

cd ..