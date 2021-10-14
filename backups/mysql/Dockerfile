FROM blacklabelops/volumerize:1.7

RUN apk add --no-cache \
    mysql-client pv

COPY postexecute /postexecute
COPY preexecute /preexecute
