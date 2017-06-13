FROM scratch
MAINTAINER "D.S. Ljungmark" <spider@modio.se>

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

ADD rootfs.tar /
RUN useradd  -M -c "nginx web server"  -d /var/lib/nginx -r -s /sbin/nologin  nginx

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
