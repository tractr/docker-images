
echo "MongoRestore starts"

if [ -z "$MONGO_USERNAME" ]; then
    mongorestore --drop --host ${MONGO_HOST} --port ${MONGO_PORT} ${VOLUMERIZE_SOURCE}
else
    mongorestore --drop --host ${MONGO_HOST} --port ${MONGO_PORT} --username ${MONGO_USERNAME} --password "${MONGO_PASSWORD}" ${VOLUMERIZE_SOURCE}
fi

echo "Import done"
