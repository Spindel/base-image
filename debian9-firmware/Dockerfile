FROM debian:stretch
MAINTAINER "D.S. Ljungmark" <ljungmark@modio.se>
ENV container docker

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
ENV LANG C.utf8
ENV LANGUAGE en_US:en
ENV LC_ALL C.utf8



ADD backports.list /etc/apt/sources.list.d/
RUN apt-get update && apt-get -y install \
                        python3 \
                        python3-requests \
                        python3-mako \
                        python3-gi \
                        python3-dbus \
                        python3-pycurl \
                        python3-openssl \
                        python3-serial \
                        python3-flufl.lock \
                        python3-netifaces \
                        python3-dbus \
                        python3-gi \
                        python3-serial && \
                apt-get download  python3-pymodbus && \
                dpkg --force-depends -i python3-pymodbus* &&  rm -f python3-pymodbus*  && \
    apt-get clean all
