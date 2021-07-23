# Dev Images for Build Node.js

## compile with the source code
* download source code tarball, e.g.
```sh
curl -L --output node.{tag}.tar.gz https://github.com/nodejs/node/archive/refs/tags/{tag}.tar.gz && tar zxvf node.{tag}.tar.gz
```

* to start the environment with sufficient memory
```sh
docker run -i -t -m {memory} -v {source-code-path}:/home/builder/src alexxyjiang/blog-site-generator:{alpine-dev}/{debian-dev} 
```

* inside the docker container, execute
```sh
./configure --ninja
ninja -C out/Release -j 4
```
if the the compiler is killed, it's usually out of memory error and could be resolved by reducing parallel number

## build package

### alpine
* to build an apk package for alpine, start the image first
```sh
docker run -i -t -m {memory} -v $(pwd)/src.alpine:/home/builder/nodejs-full alexxyjiang/blog-site-generator:alpine-dev
```

* inside the docker container, execute
```sh
cd nodejs-full && abuild -r
```
