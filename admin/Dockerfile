# Admin container
FROM registry.gitlab.com/modioab/base-image:zabbix-web-latest
MAINTAINER "D.S. Ljungmark" <ljungmark@modio.se>
ENV container docker


RUN yum -y install epel-release && \
    yum -y install nginx && \
    yum clean all && \
    systemctl enable php-fpm.service && \
    systemctl enable nginx.service

COPY files/etc/php-fpm.d/admin.conf /etc/php-fpm.d/admin.conf
COPY files/etc/nginx/nginx.conf   /etc/nginx/nginx.conf

EXPOSE 80
VOLUME [ "/sys/fs/cgroup", "/etc/zabbix/web/zabbix.conf.php", "/etc/nginx/htaccess" ]
CMD ["/usr/sbin/init"]
