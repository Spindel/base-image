# Docker container building docker container
FROM registry.gitlab.com/modioab/base-image:fedora-24-bootstrap-latest
MAINTAINER "Nicklas Lindgren" <nili@modio.se>

# If the base image does not already have the docker repository:
# COPY docker.repo /etc/yum.repos.d/docker.repo

# If the base image does not already have the build tools:
# RUN dnf -y upgrade && \
#     dnf -y install docker-engine make supermin redhat-lsb && \
#     dnf clean all

RUN dnf -y upgrade && \
    dnf clean all
