# Docker container building docker container
FROM  registry.fedoraproject.org/fedora:26


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


ADD meteor.tar.gz /data/

RUN echo wtf:x:100000:100:wtf:/data:/bin/sh >> /etc/passwd                  && \
    echo "WTF? Meteor requires /usr/local/bin/meteor to be a symlink...."   && \
    ln -s /data/.meteor/meteor /usr/local/bin/meteor                        && \
    chown -R wtf /data                                                      && \
    dnf update --refresh -y                                                 && \
    dnf clean all

USER wtf 
WORKDIR /data
