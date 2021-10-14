FROM nginx:1.20-alpine

RUN apk add bash

COPY create-env-file.sh /create-env-file.sh
COPY edit-base-url.sh /edit-base-url.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
