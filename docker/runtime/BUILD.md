# Dev Images for Build Node.js
* These docker files are provided for building node + gatsby envrionment.
* The docker file **./Dockerfile.alpine.src** is provided with node.js apk building process inside.
* The docker file **./Dockerfile.debian** is provided with node.js on debian.

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
* alpine 3.20 build-from-source (node 22)
```sh
cp Dockerfile.alpine.src Dockerfile
docker build -t alexxyjiang/blog-site-generator:alpine-src --platform linux/amd64,linux/arm64 .
```

* debian bookworm (node 22)
```sh
cp Dockerfile.debian Dockerfile
docker build -t alexxyjiang/blog-site-generator:debian --platform linux/amd64,linux/arm64 .
```
