# Docker container building docker container
FROM registry.gitlab.com/modioab/base-image/fedora-31/bootstrap:master
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

# https://github.com/containers/buildah/issues/2176#issuecomment-594126909
RUN echo deltarpm=0 >> /etc/dnf/dnf.conf && \
    dnf -y upgrade --enablerepo=updates-testing buildah && \
    dnf -y upgrade && dnf -y install xz python3-dbus && dnf clean all
# https://gitlab.com/gitlab-com/support-forum/issues/4349
ENV BUILDAH_FORMAT docker
