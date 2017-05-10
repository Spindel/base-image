# Docker container building docker container
FROM registry.gitlab.com/modioab/base-image:fedora-25-bootstrap-latest
MAINTAINER "Nicklas Lindgren" <nili@modio.se>

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

RUN dnf -y upgrade && \
    dnf clean all && \
    pip install --upgrade pip setuptools && \
    pip3 install --upgrade pip setuptools
