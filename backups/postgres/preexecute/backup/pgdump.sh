source /preexecute/utils/check-env.sh
source /preexecute/utils/create-pgpass.sh

check_env "pgdump" "POSTGRES_PASSWORD" "POSTGRES_USER" "POSTGRES_HOST" "POSTGRES_DB"

PORT="${POSTGRES_PORT:=5432}"

echo "Creating $VOLUMERIZE_SOURCE folder if not exists"
mkdir -p $VOLUMERIZE_SOURCE

echo "pg_dump starts"
pg_dump --username="${POSTGRES_USER}" --no-password --host="${POSTGRES_HOST}" --port="${PORT}" "${POSTGRES_DB}" --format=custom > ${VOLUMERIZE_SOURCE}/${POSTGRES_DB}.dump
