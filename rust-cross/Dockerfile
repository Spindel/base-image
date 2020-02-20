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


RUN dpkg --add-architecture armhf && \
    apt-get update && \
    apt-get install -y curl git ca-cacert && \
    apt-get install -y build-essential clang && \
    apt-get install -y libc6-armhf-cross libc6-dev-armhf-cross gcc-arm-linux-gnueabihf && \
    apt-get install -y libdbus-1-dev libdbus-1-dev:armhf  && \
    apt-get clean && \
    mkdir -p /cargo /code

COPY rustup.sh /usr/local/bin/
COPY config /cargo/config

ENV CARGO_HOME /cargo
ENV PATH /cargo/bin:$PATH
ENV USER root


RUN bash /usr/local/bin/rustup.sh -y && \
    rustup default stable && \
    rustup target add armv7-unknown-linux-gnueabihf && \
    rustup target add x86_64-unknown-linux-gnu

WORKDIR /code/
