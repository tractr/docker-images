source /preexecute/utils/check-env.sh
source /preexecute/utils/create-pgpass.sh

check_env "pgimport" "POSTGRES_PASSWORD" "POSTGRES_USER" "POSTGRES_HOST" "POSTGRES_DB"

PORT="${POSTGRES_PORT:=5432}"

echo "pg_restore starts"
#psql --username="${POSTGRES_USER}" --no-password --host="${POSTGRES_HOST}" --port="${PORT}" -c "DROP DATABASE \"${POSTGRES_DB}\";"
pg_restore --clean --username="${POSTGRES_USER}" --no-password --host="${POSTGRES_HOST}" --port="${PORT}" --dbname "${POSTGRES_DB}" ${VOLUMERIZE_SOURCE}/${POSTGRES_DB}.dump
echo "Import done"