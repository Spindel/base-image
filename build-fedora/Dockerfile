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

RUN echo deltarpm=0 >> /etc/dnf/dnf.conf && \
    dnf -y upgrade && dnf -y install squashfs-tools && dnf clean all
# https://gitlab.com/gitlab-com/support-forum/issues/4349
ENV BUILDAH_FORMAT docker
