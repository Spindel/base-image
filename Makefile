.PHONY: all zabbix-web frontend admin

all: zabbix-web frontend admin

zabbix-web:
	$(MAKE) -C zabbix-web

frontend:
	$(MAKE) -C frontend

admin:
	$(MAKE) -C admin
