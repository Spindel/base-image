# Docker container building docker container
FROM  scratch

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
ADD meteor.tar.gz /data/

WORKDIR /data
RUN echo "WTF? Meteor tarball has uid/gid 1000"                                  \
         " and docker duplicates filesize if we use chown"                    && \
    echo wtf:x:1000:1000:wtf:/data:/bin/sh >> /etc/passwd                     && \
    chown wtf /data                                                           && \
    echo "WTF? Meteor requires /usr/local/bin/meteor to be a symlink...."     && \
    ln -fs /data/.meteor/meteor /usr/local/bin/meteor                         && \
    chown -Rh wtf /data

USER wtf

RUN  meteor create --react app && \
    cd app && meteor add fourseven:scss@4.12.0 && \
    meteor list && meteor npm install
