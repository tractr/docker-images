# Nginx Generated Envs

This image is meant to generate a JSON file based on environment variables.

Use it to define environment variables of your PWA on runtime, and not during the build stage.

Before starting Nginx, this image will create a file in `/generated/config.json` based on environment variables.
Your PWA can consume this file to set up its configuration.

## Base URL rewriting

This image can also replace the base URL in the `index.html` file on runtime.

## Usage

To run this image:

```shell
docker run \
  -e ENVS_NAMES=VAR1,VAR2 \
  -e VAR1=test \
  -e VAR2=2 \
  -e HTML_INDEX_PATH=/var/www/index.html \
  -e HTML_BASE_HREF=/custom-base \
  -v /some/content:/usr/share/nginx/html:ro \
  -d \
  tractr/nginx-generated-envs
```

More configuration options [here](https://hub.docker.com/_/nginx).

### Serve the generated config file

Add a route to serve the generated file.

```text
location /app-config.json {
    alias /generated/config.json;
}
```

## Base

This image is built on top of `nginx:1.20-alpine`.
