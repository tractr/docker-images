FROM blacklabelops/volumerize:1.5.0

RUN apk add --no-cache \
    mongodb-tools

COPY postexecute /postexecute
COPY preexecute /preexecute

ENV MONGO_PORT 27017
ENV MONGO_HOST mongodb
