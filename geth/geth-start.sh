docker compose -f geth.yml down
docker compose -f geth.yml up -d
docker compose -f geth.yml logs -f