FROM scratch
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

ENV LC_CTYPE C.utf8
ENV LANG C.utf8
ENV LANGUAGE en_US:en
ENV LC_ALL C.utf8


ADD rootfs.tar /
RUN echo tsflags=nodocs >> /etc/dnf/dnf.conf

# https://github.com/projectatomic/buildah/issues/874
RUN dnf remove -y selinux-policy-targeted

COPY storage.conf /etc/containers/storage.conf
COPY libpod.conf /etc/containers/libpod.conf
