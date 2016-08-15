# Docker container building docker container
FROM fedora:24
MAINTAINER "Nicklas Lindgren" <nili@modio.se>

COPY docker.repo /etc/yum.repos.d/docker.repo
RUN dnf -y upgrade && \
    dnf -y install docker-engine make supermin redhat-lsb && \
    dnf clean all
