# Dev Images for Build Node.js
* These docker files are provided for building node + gatsby envrionment.
* The docker file **./Dockerfile.alpine.src** is provided with node.js apk building process inside.
* The docker file **./Dockerfile.debian** is provided with node.js on debian.

## docker commands
* alpine 3.20 build-from-source (node 22)
```sh
cp Dockerfile.alpine.src Dockerfile
docker build -t alexxyjiang/blog-site-generator:alpine-src .
```

* debian bookworm (node 22)
```sh
cp Dockerfile.debian Dockerfile
docker build -t alexxyjiang/blog-site-generator:debian .
```
