source /preexecute/utils/check-env.sh

PORT="${POSTGRES_PORT:=5432}"
FILE="${HOME}/.pgpass"


if [[ ! -f "$FILE" ]]; then
  check_env "create-pgpass" "POSTGRES_PASSWORD" "POSTGRES_USER" "POSTGRES_HOST" "POSTGRES_DB"
  echo "Creating pass file in ${FILE}"
  echo "${POSTGRES_HOST}:${PORT}:${POSTGRES_DB}:${POSTGRES_USER}:${POSTGRES_PASSWORD}" > "${FILE}"
  chmod 0600 "${FILE}"
fi
