# Managed Logstash

A Logstash image configured to be managed from an Elastic Cluster (Centralized pipeline management).

## Configuration example

Starts a Logstash container with the `5044` port exposed:

```shell
docker run -d \
    -e ES_CLOUD_ID=xxxxxxxxxx \
    -e ES_CLOUD_AUTH=user:password \
    -e ES_PIPELINE_ID=xxxxxxxxxx \
    -p 5044:5044 \
    tractr/managed-logstash:latest
```

### Envrionment variables

- ES_CLOUD_ID: Sets the CloudId of the Elastic deployment. Sets the `xpack.management.elasticsearch.cloud_id` value.
- ES_CLOUD_AUTH: Sets the authentication of the Elastic deployment. Sets the `xpack.management.elasticsearch.cloud_auth` value. Format: `user:password`.
- ES_PIPELINE_ID: Sets the pipeline id that logstash will pull configuration from. Sets the `xpack.management.pipeline.id` value.

For more information about these variables, please refer to the [Elastic documentation](https://www.elastic.co/guide/en/logstash/current/configuring-centralized-pipelines.html).

### Sample pipeline

```text
input {
  tcp {
    port => 5044
    codec => "json"
  }
}
filter {
  date {
    match => [ "timestamp", "UNIX_MS" ]
  }
  if [source][remoteAddress]
  {
    geoip {
      source => "[source][remoteAddress]"
      target => "geoip"
    }
  }
}
output {
  elasticsearch {
    cloud_id => "${ES_CLOUD_ID}"
    cloud_auth => "${ES_CLOUD_AUTH}"
    index => "api-%{+YYYY.MM.dd}"
  }
}
```

For more information about this pipeline, please refer to the [Elastic documentation](https://www.elastic.co/guide/en/logstash/current/plugins-outputs-elasticsearch.html).
