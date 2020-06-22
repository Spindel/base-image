FROM debian:9

ARG URL=unknown
ARG COMMIT=unknown
ARG BRANCH=unknown
ARG HOST=unknown
ARG DATE=unknown

LABEL "se.modio.ci.url"=$URL \
    "se.modio.ci.branch"=$BRANCH \
    "se.modio.ci.commit"=$COMMIT \
    "se.modio.ci.host"=$HOST \
    "se.modio.ci.date"=$DATE

# cmake and cross g++ mighht be needed for cross compiling mbus
# dbus might not be needed
RUN dpkg --add-architecture armhf && \
    apt-get update && \
    apt-get install -y curl git  && \
    apt-get install -y build-essential cmake file && \
    apt-get install -y libc6-armhf-cross libc6-dev-armhf-cross gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf && \
    apt-get install -y libdbus-1-dev libdbus-1-dev:armhf  && \
    apt-get clean && \
    mkdir -p /local/stage && \
    mkdir -p /usr/local/etc/cmake && \
    mkdir -p /code

COPY cmake_arm-linux-gnueabihf.txt /usr/local/etc/cmake/

ENV USER root

WORKDIR /code/
