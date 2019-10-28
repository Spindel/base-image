FROM scratch
MAINTAINER "D.S. Ljungmark" <spider@modio.se>

ARG URL=unknown
ARG COMMIT=unknown
ARG BRANCH=unknown
ARG HOST=unknown
ARG DATE=unknown

LABEL "se.modio.ci.url"=$URL "se.modio.ci.branch"=$BRANCH "se.modio.ci.commit"=$COMMIT "se.modio.ci.host"=$HOST "se.modio.ci.date"=$DATE

ADD rootfs.tar /
COPY pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY pgbouncer_exporter /usr/local/bin/
RUN mkdir -p /etc/pgbouncer/dropin && touch /etc/pgbouncer/dropin/database.conf
USER pgbouncer

CMD ["/usr/bin/pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]
