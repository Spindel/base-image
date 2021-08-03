FROM scratch
MAINTAINER "D.S. Ljungmark" <spider@modio.se>


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

ENV LC_CTYPE C.utf8
ENV LANG C.utf8
# Because OS X
ENV LANGUAGE en_US:en
ENV LC_ALL C.utf8

# Bug compat with Gitlab Registry
# https://gitlab.com/gitlab-com/support-forum/issues/4349
ENV BUILDAH_FORMAT docker

ADD rootfs.tar /
# https://github.com/projectatomic/buildah/issues/874
# https://github.com/containers/libpod/issues/5154
# RUN echo deltarpm=0 >> /etc/dnf/dnf.conf && \
#    dnf remove -y selinux-policy-targeted

COPY storage.conf /etc/containers/storage.conf
COPY containers.conf /etc/containers/containers.conf
COPY modio.yaml /etc/containers/registries.d/modio.yaml
COPY gitlab_com_modioab.pub /etc/pki/containers/gitlab_com_modioab.pub
# Uncomment the below to require all containers in registry.gitlab.com/modioab/scada-hello to be signed
# RUN  podman image trust set --type signedby --pubkeysfile /etc/pki/containers/gitlab_com_modioab.pub  registry.gitlab.com/modioab/scada-hello
# Uncomment the below to require all containers in registry.gitlab.com/modioab to be signed
# RUN  podman image trust set --type signedby --pubkeysfile /etc/pki/containers/gitlab_com_modioab.pub  registry.gitlab.com/modioab
