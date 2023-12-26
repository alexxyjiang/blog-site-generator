# Dev Images for Build Node.js
* The docker file **./Dockerfile.alpine.dev** is provided for building the node.js dev environment **alexxyjiang/blog-site-generator:alpine-dev**. It provides minimal dependencies to compile the node.js from source code.
* The docker file **./Dockerfile.alpine.apk** is provided for building the node.js dev environment **alexxyjiang/blog-site-generator:alpine-apk**. It provides minimal dependencies build node.js alpine package from source code.

## compile with the source code
* update the docker images (optional)
```sh
cp Dockerfile.alpine.dev Dockerfile
docker build -t alexxyjiang/blog-site-generator:alpine-dev .
```

* download source code tarball, e.g.
```sh
export NODE_VERSION_TAG="v20.10.0"
curl -L --output "node.${NODE_VERSION_TAG}.tar.gz" "https://github.com/nodejs/node/archive/refs/tags/${NODE_VERSION_TAG}.tar.gz" && tar zxvf "node.${NODE_VERSION_TAG}.tar.gz"
```

* go to the path of downloaded source code, start the environment with sufficient memory
```sh
export SOURCE_CODE_PATH="$(pwd)/node-20.10.0"
docker run -i -t -v ${SOURCE_CODE_PATH}:/home/builder/src alexxyjiang/blog-site-generator:alpine-dev
```

* inside the docker container, execute
```sh
cd src
./configure --ninja
ninja -C out/Release -j 8
```
If the the compiler is killed, it's usually an out-of-memory error and could be resolved by increasing the memory resource of docker or reducing the parallel number.

## build the apk package for alpine
* update the docker images (optional)
```sh
cp Dockerfile.alpine.apk Dockerfile
docker build -t alexxyjiang/blog-site-generator:alpine-apk .
```

* to build an apk package for alpine, start the image first
```sh
docker run -i -t -v $(pwd)/src.alpine:/home/builder/nodejs-full alexxyjiang/blog-site-generator:alpine-apk
```

* inside the docker container, execute
```sh
cd nodejs-full && abuild -r
cd && tar zcvf packages.tar.gz packages
mv packages.tar.gz nodejs-full
```
