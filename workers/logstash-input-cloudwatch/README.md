# Logstash with Cloudwatch plugin

Logstash image with Cloudwatch plugins installed.

## Installed plugins

### Plugin logstash-input-cloudwatch

Get metrics from Cloudwatch.

See https://www.elastic.co/guide/en/logstash/current/plugins-cloudwatch.html for more information.

```text
input {
    cloudwatch {
        access_key_id => "AKXXXXXXXXX"
        secret_access_key => "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        namespace => "AWS/ECS"
        metrics => ["CPUUtilization", "MemoryUtilization"]
        filters => {"ClusterName" => "production-cluster"}
        region => "us-east-1"
    }
}
```

For more information about available metrics: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html

### Plugin logstash-input-cloudwatch_logs

Get logs from Cloudwatch.

See https://github.com/lukewaite/logstash-input-cloudwatch-logs

Configuration example:

```text
input {
    cloudwatch_logs {
        access_key_id => "AKXXXXXXXXX"
        secret_access_key => "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        log_group => "sample-logs-group"
        region => "us-east-1"
    }
}
```

#### Parameters
| Parameter | Input Type | Required | Default |
|-----------|------------|----------|---------|
| log_group | string or Array of strings | Yes | |
| log_group_prefix | boolean | No | `false` |
| start_position | `beginning`, `end`, or an Integer | No | `beginning` |
| sincedb_path | string | No | `$HOME/.sincedb*` |
| interval | number | No | 60 |
| aws_credentials_file | string | No | |
| access_key_id | string | No | |
| secret_access_key | string | No | |
| session_token | string | No | |
| region | string | No | `us-east-1` |
| codec | string | No | `plain` |