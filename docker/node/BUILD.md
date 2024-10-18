# Dev Images for Build Node.js
* These docker files are provided for building node + gatsby envrionment, node official builds.
* The docker file **./Dockerfile.alpine** is provided with node.js on alpine.
* The docker file **./Dockerfile.debian** is provided with node.js on debian-slim.

## multiplatform support
* Please refer to the [official document](https://docs.docker.com/build/guide/multi-platform/) for the multiplatform support.

* For linux docker container, you should append the following content to **/etc/docker/daemon.json**.
```json
"features": {
  "containerd-snapshotter": true
}
```

* Then please install multiplatform support with (required once).
```sh
docker run --privileged --rm tonistiigi/binfmt --install all
```

## docker commands
* alpine 3.20 with node 22 pre-installed
```sh
cp Dockerfile.alpine.node Dockerfile
docker build -t alexxyjiang/blog-site-generator:alpine-node --platform linux/amd64,linux/arm64 .
```

* debian bookworm with node 22 pre-installed
```sh
cp Dockerfile.debian.node Dockerfile
docker build -t alexxyjiang/blog-site-generator:debian-node --platform linux/amd64,linux/arm64 .
```