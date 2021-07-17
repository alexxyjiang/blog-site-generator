FROM debian:buster
LABEL maintainer="Xueyuan, Jiang <alexxyjiang@gmail.com>"
ENV LANG="C.UTF-8" LC_ALL="C.UTF-8" DEBIAN_FRONTEND="noninteractive"
RUN apt-get update --fix-missing \
  && apt-get install -y binutils build-essential curl git pkg-config procps zsh
RUN bash -c "$(curl -fsSL https://deb.nodesource.com/setup_14.x)" \
  && apt-get update --fix-missing \
  && apt-get install -y python3-dev python3-pip nodejs
RUN npm install -g gatsby-cli
RUN useradd -m -s /bin/zsh editor
USER editor
WORKDIR /home/editor
RUN zsh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY .zshrc /home/editor/.zshrc
CMD [ "/bin/zsh" ]
