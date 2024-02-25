docker compose -f beacon.yml down
docker compose -f beacon.yml up -d
docker compose -f beacon.yml logs -f