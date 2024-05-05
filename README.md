# blog-site-generator
tool for generating a personal blog site

## how to use

### start the docker container
* **important** before starting, ensure your workspace is initialized with `git`, you may `git clone` an existing repository, or `git init` to create a new repository. you may receive build errors of the package *sentry* without *git*.

* the **gatsby** environment could be started like,
```sh
# linux
docker run -i -t --network host -v $(pwd)/[path-to-site]:/home/editor/[path-to-site] alexxyjiang/blog-site-generator 
# Mac OS
docker run -i -t -p [port-develop]:8000 -p [port-serve]:9000 -v $(pwd)/[path-to-site]:/home/editor/[path-to-site] alexxyjiang/blog-site-generator 
```
1. the default *latest* tag is based on alpine linux 3.18 to minimize the docker image size, you may choose *debian* tag.
2. to enable *husky* hook support, in that case, the path `[path-to-site]` should be initalized with `git`.

### inside the docker container
* more details for building the site can be found at the [**gatsby**](https://www.gatsbyjs.com/docs/tutorial/) official site, the basic command to start a new site,
```sh
# create a new site
npm config set registry https://registry.npmmirror.com
gatsby new [path-to-site] https://github.com/alxshelepenok/gatsby-starter-lumen
```

* test/build the site:
```sh
# switch to the site path
cd [path-to-site]
# test the site, add param '-H:0.0.0.0' in case you're on MacOS
gatsby develop [-H:0.0.0.0]
# build the site for release, please commit your changes before doing this
gatsby build
# serve inside the docker container, add param '-H:0.0.0.0' in case you're on MacOS
gatsby serve [-H:0.0.0.0]
```

### publish to real server
* copy/mount the output under *public* with your web server like *nginx*, for example, you could serve with *nginx* docker container using,
```sh
# start the nginx docker container
docker run -i -t --network host -v $(pwd)/[path-to-site]/public:/usr/share/nginx/html nginx:stable
```
