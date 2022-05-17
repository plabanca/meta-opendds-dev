# Pull base image.
FROM ubuntu:20.04

LABEL maintainer="Phillip LaBanca <labancap@objectcomputing.com>"

ENV TZ="America/Chicago"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install updates to base image
RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio \
python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa \
libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool  make python3-pip apt-utils

RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN id build 2>/dev/null || useradd --uid 1000 --create-home build
RUN apt-get -y install sudo
RUN echo "build ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers

USER build
WORKDIR /home/build/

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
