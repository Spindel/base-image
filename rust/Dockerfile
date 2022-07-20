FROM docker.io/library/rust:latest

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

# Note!  Do not add openssl-dev, curl-dev or similar headers here, as that may
# cause feature-detection to happen in various rust projects, causing builds to
# change from static bundled versions to prefer system installed versions.
#
# Many rust projects depend on other crates that do compile-time feature detection.

# Whats installed and why:
#
# x86_64/GNU:   libc-dev
# x86_64/musl:   musl-tools, musl-dev
# armv7/GNU:	libc6-armhf-cross libc6-dev-armhf-cross gcc-arm-linux-gnueabihf
# clippy, rustfmt:  Commonly used in rust projects
# dbus:  To run modio-localapi tests under
# maturin: To package rust binaries as python, or build python modules in rust
# grcov+llvm-tools-preview:   To get code-coverage from tests
# cargo-llvm-cov:  gives reports in terminal for tests,
#                  and sets up cargo for coverage profiling in an easier way.

RUN dpkg --add-architecture armhf && \
    apt-get update \
    && apt-get install --no-install-recommends -y libc-dev \
    && apt-get install --no-install-recommends -y musl-tools musl-dev \
    && apt-get install --no-install-recommends -y libc6-armhf-cross libc6-dev-armhf-cross gcc-arm-linux-gnueabihf \
    && apt-get install --no-install-recommends -y dbus \
    && apt-get clean \
    && rustup target add armv7-unknown-linux-gnueabihf \
    && rustup target add x86_64-unknown-linux-musl \
    && rustup target add x86_64-unknown-linux-gnu \
    && rustup component add clippy \
    && rustup component add rustfmt \
    && rustup component add llvm-tools-preview \
    && cargo install cargo-audit maturin grcov cargo-llvm-cov \
    && rustup --version \
    && cargo --version \
    && rustc --version
