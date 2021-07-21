# Dev Images for Build Node.js

to start the environment
```sh
docker run -i -t -v [source-code-path]:/root/src [image-name]
```
inside the docker container, execute
```sh
./configure --ninja
ninja -C out/Release -j 4
```
if the the compiler is killed, it's usually out of memory error and could be resolved by reducing parallel number
