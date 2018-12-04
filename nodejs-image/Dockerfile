FROM scratch
MAINTAINER "ThorAndy" <andreas@modio.se>

ENV LC_CTYPE C.utf8
ENV LANG C.utf8

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

ADD rootfs.tar /
