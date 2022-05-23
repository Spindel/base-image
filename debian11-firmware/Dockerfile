FROM debian:bullseye
MAINTAINER "D.S. Ljungmark" <ljungmark@modio.se>
ENV container docker

ARG URL=unknown
ARG COMMIT=unknown
ARG BRANCH=unknown
ARG HOST=unknown
ARG DATE=unknown

LABEL "se.modio.ci.url"=$URL \
    "se.modio.ci.host"=$HOST \
    "se.modio.ci.date"=$DATE \
    "se.modio.ci.branch"=$BRANCH \
    "se.modio.ci.commit"=$COMMIT


RUN apt-get update && \
    apt-get --assume-yes --no-install-recommends install \
# Added for our use in containers
        openssh-client \
        git \
        python3-setuptools \
        python3-wheel \
# Below are part of system image
        dbus \
        python3 \
        python3-pip \
        python3-gi \
        python3-dbus \
        python3-pycurl \
        python3-serial \
        python3-requests \
        python3-flufl.lock \
        python3-netifaces \
        python3-serial \
        python3-serial-asyncio \
        python3-pymodbus \
	squashfs-tools \
    && apt-get clean all
