
echo "Creating $VOLUMERIZE_SOURCE folder if not exists"
mkdir -p $VOLUMERIZE_SOURCE

echo "MongoDump starts"
if [ -z "$MONGO_USERNAME" ]; then
    mongodump --host ${MONGO_HOST} --port ${MONGO_PORT} --out ${VOLUMERIZE_SOURCE}
else
    mongodump --host ${MONGO_HOST} --port ${MONGO_PORT} --username ${MONGO_USERNAME} --password "${MONGO_PASSWORD}" --out ${VOLUMERIZE_SOURCE}
fi

echo "Dump done"
