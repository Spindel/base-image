FROM centos/mongodb-36-centos7:latest
# Above is maintained here https://github.com/sclorg/mongodb-container

ARG URL=unknown
ARG COMMIT=unknown
ARG BRANCH=unknown
ARG HOST=unknown
ARG DATE=unknown

LABEL "se.modio.ci.url"=$URL  "se.modio.ci.branch"=$BRANCH  "se.modio.ci.commit"=$COMMIT  "se.modio.ci.host"=$HOST  "se.modio.ci.date"=$DATE

ENV LANG C.UTF-8
ENV LC_CTYPE C.utf8

COPY mongod.conf /etc/mongod.conf
