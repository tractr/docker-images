# Auto GPT

Docker image with [Auto GPT](https://github.com/Significant-Gravitas/Auto-GPT) and [ttyd](https://github.com/tsl0922/ttyd) installed to make it available in the browser.

You should serve this container behind a reverse proxy with HTTPS and authentication.

## Usage

### Minimalist

```shell
docker run -p 7681:7681 -e OPENAI_API_KEY=<apikey> tractr/auto-gpt:0.2.2
```

### More options

```shell
docker run -p 7681:7681 \
  -e GOOGLE_API_KEY=<apikey> \
  -e OPENAI_API_KEY=<apikey> \
  -e MEMORY_BACKEND=redis \
  -e REDIS_HOST=localhost \
  -e REDIS_PORT=6379 \
  -e REDIS_PASSWORD=<PASSWORD> \
  -e WIPE_REDIS_ON_START=False \
  -e AUTO_GPT_ARGS="--gpt4only --debug" \
  tractr/auto-gpt:0.2.2
```

To check all available options, see the [env file](https://github.com/Significant-Gravitas/Auto-GPT/blob/master/.env.template).

More info [here](https://significant-gravitas.github.io/Auto-GPT/configuration/).

## Build

To build the image, run:

```shell
docker build -t tractr/auto-gpt:0.2.2 .
```
### Push to Docker Hub

```shell
docker push tractr/auto-gpt:0.2.2
```
