# Base zabbix-web for zabbix 3.0 image
FROM centos:7
MAINTAINER "D.S. Ljungmark" <ljungmark@modio.se>
ENV container docker
STOPSIGNAL RTMIN+3

COPY container_limits.conf  /etc/security/limits.d/
COPY RPM-GPG-KEY-ZABBIX-3.0 /etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX-3.0

# Zabbix server from zabbix
RUN rpm --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX-3.0         && \
    rpm --import https://getfedora.org/static/352C64E5.txt              && \
    rpm --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7           && \
    yum -y install epel-release https://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm && \
    yum clean metadata                                                  && \
    yum -y update                                                       && \
    yum -y install nginx \
                   zabbix-web-pgsql \
                   php-fpm \
                   python-setuptools \
                   python2-pip    \
                   python-requests                                      && \
    rm -f /etc/php-fpm.d/www.conf                                       && \
    yum clean all                                                       && \
    echo ForwardToConsole=yes >> /etc/systemd/journald.conf             && \
    echo MaxLevelConsole=debug >> /etc/systemd/journald.conf            && \
    rm -f /etc/httpd/logs && mkdir /etc/httpd/logs                      && \
    ln -sf /dev/stdout /etc/httpd/logs/access_log                       && \
    ln -sf /dev/stderr /etc/httpd/logs/error_log                        && \
    systemctl mask systemd-remount-fs.service                           && \
    systemctl mask systemctl mask getty@tty1.service


COPY zabbix.ini /etc/php.d/zabbix.ini
COPY php-fpm.conf /etc/php-fpm.conf
RUN  chmod go-wx /etc/php.d/zabbix.ini  /etc/systemd/journald.conf

CMD ["/sbin/init"]
