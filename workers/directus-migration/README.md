# Directus Migration

This image allows you to migrate a Directus database from one instance to another.
Both Directus instances must have the exact same version.

## Usage

```shell
docker run --rm \
    -e BASE_DIRECTUS_URL=https://base.directus.example.com \
    -e BASE_ACCESS_TOKEN=BASEXXXXXXXXXX \
    -e TARGET_DIRECTUS_URL=https://target.directus.example.com \
    -e TARGET_ACCESS_TOKEN=TARGETXXXXXXXXXX
    tractr/directus-migration
```

## Build the image

```shell
docker build -t tractr/directus-migration:0.1.0 .
docker build -t tractr/directus-migration:latest .
```

## Source

The source code is available [here](https://github.com/tractr/docker-images/tree/main/workers/directus-migration).

This is based on [this article](https://docs.directus.io/guides/migration/node.html#migrate-your-data-model-with-node-js).