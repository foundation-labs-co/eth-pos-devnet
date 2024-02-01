docker compose -f validator.yml down
docker compose -f validator.yml up -d
docker compose -f validator.yml logs -f