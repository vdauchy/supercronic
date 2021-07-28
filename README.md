# SUPERCRONIC
### Super light Supercronic container.

This is made as light and simple as possible using `from scratch` image.

This repository gives you the dockerfile to containerize https://github.com/aptible/supercronic.

Build the image locally:
```shell script
make build
```

Pull the latest image from dockerhub:
```shell
docker pull vdauchy/supercronic
```

Run the latest image:
```shell
docker run vdauchy/supercronic:latest
```

Use Supercronic binary in your own image by copying it:
```shell
COPY --from=vdauchy/supercronic:latest /supercronic /usr/bin/supercronic
```