# blog-site-generator
tool for generating personal blog site

## how to use

* the **gatsby** environment could be started like,
```sh
# start the gatsby docker container
docker run -i -t --network host -v $(pwd)/[path-to-site]:/home/editor/[path-to-site] alexxyjiang/blog-site-generator 
```

* more details for build the site could be found at the [**gatsby**](https://www.gatsbyjs.com/docs/tutorial/) official site, the basic command to start a new site,
```sh
# create a new site
npm config set registry https://registry.npm.taobao.org
gatsby new [path-to-site] https://github.com/alxshelepenok/gatsby-starter-lumen
```

* test/build the site:
please switch to the path of site, then you could,
```sh
# test the site
gatsby develop
# build the site for release
gatsby build
# serve inside the docker container
gatsby serve
```

* to test the site before release, you could serve it with local nginx
```sh
# start the nginx docker container
docker run -i -t --network host -v $(pwd)/[path-to-site]/public:/usr/share/nginx/html nginx:stable
```
