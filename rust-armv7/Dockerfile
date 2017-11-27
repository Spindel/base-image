FROM scratch
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


ENV PATH $PATH:/root/.cargo/bin
ADD rootfs.tar /
