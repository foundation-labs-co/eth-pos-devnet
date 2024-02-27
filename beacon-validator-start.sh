# start beacon
docker compose -f ./lighthouse/beacon.yml down
docker compose -f ./lighthouse/beacon.yml up -d

# import validator keys
docker run -it --rm \
-v ./consensus/validatordata-lighthouse:/root/lighthouse \
-v ./consensus/validatordata-lighthouse/custom/validators:/root/.lighthouse/custom/validators \
-v ./config:/config \
-v ./lighthouse/validator_keys:/keys \
sigp/lighthouse \
lighthouse account validator import --directory=/keys --testnet-dir=/config --reuse-password

# start validator
docker compose -f ./lighthouse/validator.yml down
docker compose -f ./lighthouse/validator.yml up -d