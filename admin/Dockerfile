# Frontend container 
FROM registry.gitlab.com/modioab/base-image:zabbix-web-latest
MAINTAINER "D.S. Ljungmark" <ljungmark@modio.se>
ENV container docker

ADD files/etc/php-fpm.d/admin.conf /etc/php-fpm.d/admin.conf

EXPOSE 9000
VOLUME [ "/sys/fs/cgroup", "/etc/zabbix/web/zabbix.conf.php" ]
CMD ["/usr/sbin/init"]
