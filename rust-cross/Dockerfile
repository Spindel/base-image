FROM debian:9

ARG URL=unknown
ARG COMMIT=unknown
ARG BRANCH=unknown
ARG HOST=unknown
ARG DATE=unknown

LABEL "se.modio.ci.url"=$URL
LABEL "se.modio.ci.branch"=$BRANCH
LABEL "se.modio.ci.commit"=$COMMIT
LABEL "se.modio.ci.host"=$HOST
LABEL "se.modio.ci.date"=$DATE

ENV LC_CTYPE C.utf8
ENV LANG C.utf8
# Because OS X
ENV LANGUAGE en_US:en
ENV LC_ALL C.utf8


RUN apt update && \
    apt install -y  build-essential \
                    ca-cacert \
                    clang \
                    curl \
                    git \
                    gcc-arm-linux-gnueabihf \
                    libc6-armhf-cross \
                    libc6-dev-armhf-cross && \
    apt clean && \
    mkdir -p /.cargo/ && \
    groupadd -g 10000 rust && \
    useradd -u 10000 -g 10000 -m rust

COPY config /.cargo/config
COPY rustup.sh /usr/local/bin

USER rust
ENV PATH $PATH:/home/rust/.cargo/bin
ENV USER rust


RUN mkdir -p /home/rust/code && \
    bash /usr/local/bin/rustup.sh -y && \
    rustup default stable && \
    rustup target add armv7-unknown-linux-gnueabihf

WORKDIR /home/rust/code
