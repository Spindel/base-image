FROM scratch


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
ENV LANGUAGE en_US:en
ENV LC_ALL C.utf8


ADD rootfs.tar /
# Supermin misses update-alternatives symlink for some reason
RUN ln -s /usr/lib/golang/bin/go /etc/alternatives/go && \
    ln -s /usr/lib64/pkcs11/p11-kit-trust.so /etc/alternatives/libnssckbi.so.x86_64
