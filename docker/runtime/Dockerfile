FROM alpine:3.14
LABEL maintainer="Xueyuan, Jiang <alexxyjiang@gmail.com>"
ENV LANG="C.UTF-8" LC_ALL="C.UTF-8"
RUN apk update \
  && apk add --no-cache curl git sudo vim zsh
COPY .abuild/builder.rsa.pub /etc/apk/keys/builder.rsa.pub
COPY .abuild/packages.tar.gz /
RUN tar zxvf packages.tar.gz \
  && apk add packages/builder/x86_64/nodejs-full-14.17.3-r0.apk \
  && rm -rf packages.tar.gz packages
RUN apk add --no-cache build-base python3 vips-dev
RUN npm install -g gatsby-cli
RUN adduser -D -s /bin/zsh editor
RUN echo 'editor:M00n' | chpasswd
RUN echo 'editor ALL=(ALL) ALL' > /etc/sudoers.d/editor
USER editor
WORKDIR /home/editor
RUN zsh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY .zshrc /home/editor/.zshrc
CMD [ "/bin/zsh" ]
