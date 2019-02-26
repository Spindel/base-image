# Docker container building docker container
FROM registry.gitlab.com/modioab/base-image/fedora-28/bootstrap:master
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

RUN dnf -y upgrade && dnf -y install podman buildah rsync zstd && dnf clean all
# https://gitlab.com/gitlab-com/support-forum/issues/4349
ENV BUILDAH_FORMAT docker
