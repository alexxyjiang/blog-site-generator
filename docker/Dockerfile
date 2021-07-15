FROM debian:buster
LABEL maintainer="Xueyuan, Jiang <alexxyjiang@gmail.com>"
ENV LANG="C.UTF-8" LC_ALL="C.UTF-8" DEBIAN_FRONTEND="noninteractive"
RUN apt-get update --fix-missing \
  && apt-get install -y binutils build-essential curl git procps zsh
RUN bash -c "$(curl -fsSL https://deb.nodesource.com/setup_16.x)" \
  && apt-get update --fix-missing \
  && apt-get install -y python3-dev python3-pip nodejs
RUN npm install -g gatsby-cli
