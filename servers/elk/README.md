# README

Elastic Search / Logstash / Kiabana stack with Elastic Search Curator installed.

## Logstash configuration

Basic configuration are provided in this container for JSON input through Filebeat.
Location data store in `data.location` will binded as GeoIp in ES.
You may need to override these files.

## Curator

A configuration for Elastic Search is also provided. A script to run Curator is available with the `run-curator` command.
To run this from your host : `docker exec container_name run-curator`.
