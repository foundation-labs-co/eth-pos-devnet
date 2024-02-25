docker run --net=custom_network -it --rm \
  -v $PWD/../consensus/validatordata-lighthouse/custom/validators:/keys \
  -v $PWD/../config:/config \
  sigp/lighthouse \
  lighthouse account validator exit \
  --testnet-dir=/config \
  --beacon-node=http://lighthouse-beacon-chain:5002 \
  --keystore=/keys/0xaeaf1dfbee33a3a11fc8a4e8c971c2e74ee42f96df6b63fc03432cd713e8b4271b78b4bfb5abb2b5aef320d960c0f37c/keystore-m_12381_3600_320_0_0-1708845000.json
  