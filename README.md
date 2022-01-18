<h1 align="center">void-container</h1> 
<p align="center"><a href="https://voidlinux.org/">Void Linux</a> Podman / Docker Containers </p>

## Introduction
- This Repository Contains Dockerfiles to build [Void Linux](https://voidlinux.org) Podman/Docker Images. 
- Images are built weekly and on each push to the repository by Github Actions.
- Images are hosted and available at [Github Container Registry](https://ghcr.io/varbhat/void-container).
- Images are available in both glibc and musl variants for amd64 and arm64 architectures.

## Usage
```bash
docker pull ghcr.io/varbhat/void-container:latest
```
- `latest` tag refers to `glibc` tag. 
- other tags `glibc`,`musl`,`glibc-amd64`,`glibc-arm64`,`musl-amd64`,`musl-arm64` can also be used.

## License
[MIT](LICENSE)
