FROM scratch


ARG URL=unknown
ARG COMMIT=unknown
ARG BRANCH=unknown
ARG HOST=unknown
ARG DATE=unknown

LABEL "se.modio.ci.url"=$URL "se.modio.ci.branch"=$BRANCH "se.modio.ci.commit"=$COMMIT "se.modio.ci.host"=$HOST "se.modio.ci.date"=$DATE

ENV LC_CTYPE C.utf8
ENV LANG C.utf8
# Because OS X
ENV LANGUAGE en_US:en
ENV LC_ALL C.utf8

# Restore some golang defaults that Fedora helpfully disabled
# https://go.dev/ref/mod#environment-variables
ENV GOPROXY https://proxy.golang.org,direct
ENV GOSUMDB sum.golang.org

ADD rootfs.tar /
