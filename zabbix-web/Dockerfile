# Base zabbix-web for zabbix 3.0 image
FROM centos:7
MAINTAINER "D.S. Ljungmark" <ljungmark@modio.se>
ENV container docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# Zabbix server from zabbix
RUN yum install -y http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm && \
    yum install -y zabbix-web-pgsql  && \
    yum clean all && \
    systemctl enable httpd.service

ADD files/zabbix.conf /etc/httpd/conf.d/zabbix.conf

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
