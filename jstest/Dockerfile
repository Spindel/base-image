# Docker container building docker container
ARG IMAGE_BUILD_FROM
FROM $IMAGE_BUILD_FROM
MAINTAINER "Nicklas Lindgren" <nili@modio.se>

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

RUN dnf --refresh -y install xorg-x11-server-Xvfb firefox chromium && dnf clean all
