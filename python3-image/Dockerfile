FROM scratch
MAINTAINER "Nicklas Lindgren" <nili@modio.se>

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

# Because OS X
ENV LANG  C.utf8
ENV LANGUAGE en_US:en
ENV LC_ALL C.utf8


ADD rootfs.tar /
ADD get-pip.py /usr/local/bin
RUN ln -f -s python3 /usr/bin/python && \
    python3 /usr/local/bin/get-pip.py
