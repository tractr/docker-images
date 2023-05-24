FROM tractr/volumerize:1.8

ARG POSTGRES_VERSION=15

RUN apk update
RUN apk add --no-cache postgresql${POSTGRES_VERSION}-client

COPY postexecute /postexecute
COPY preexecute /preexecute
