docker run -it --rm \
-v $PWD/../consensus/validatordata-lighthouse:/root/lighthouse \
-v $PWD/../consensus/validatordata-lighthouse/custom/validators:/root/.lighthouse/custom/validators \
-v $PWD/../config:/config \
-v ./validator_keys:/keys \
sigp/lighthouse \
lighthouse account validator import --directory=/keys --testnet-dir=/config --reuse-password