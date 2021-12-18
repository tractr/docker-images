# README

Elastic Search / Logstash / Kiabana stack with Elastic Search Curator installed.

## Logstash configuration

Basic configuration are provided in this container for JSON input through Filebeat.
Location data store in `data.location` will binded as GeoIp in ES.
You may need to override these files.

## Curator

A configuration for Elastic Search is also provided. A script to run Curator is available with the `run-curator` command.
To run this from your host : `docker exec container_name run-curator`.
The container automatically runs curator with CRON.
The log retention is set to 45 day by default. This can be change with environment variable `CURATOR_RETENTION_DAYS`.

# Usage example

```shell
docker run -d \
    -p 9200:9200 \
    -p 5044:5044 \
    -p 5601:5601 \
    -e CURATOR_RETENTION_DAYS=45 \
    -v ./elasticsearch:/var/lib/elasticsearch \
    tractr/elk:latest
```
