curl -H "Content-Type: application/json" \
    --data-raw '{ "jsonrpc":"2.0","method":"admin_addPeer", "params":["enode://45cfca60d4ee1fa41e7785cf219ec4711be78fa844ca957b6584f3d20eb808747d1053933b464ff2e4ca6750b4e75bdd5e319b0692d1247450a95246e36ba23e@geth2:30456"], "id":1 }' \
    localhost:9545