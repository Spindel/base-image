# Docker container building docker container
FROM registry.gitlab.com/modioab/base-image:fedora-26-build-master

ENV PLATFORM os.linux.x86_64
ENV RELEASE 1.5

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


ADD "https://meteorinstall-4168.kxcdn.com/packages-bootstrap/${RELEASE}/meteor-bootstrap-${PLATFORM}.tar.gz" /tmp/meteor.tgz

RUN mkdir /data                         && \
    tar xf /tmp/meteor.tgz -C /data/    && \
    rm -f /tmp/meteor.tgz

RUN echo wtf:x:100000:100:wtf:/data:/bin/sh >> /etc/passwd                  && \
    echo "WTF? Meteor requires /usr/local/bin/meteor to be a symlink...."   && \
    ln -s /data/.meteor/meteor /usr/local/bin/meteor                        && \
    chown -R wtf /data

USER wtf 
WORKDIR /data

