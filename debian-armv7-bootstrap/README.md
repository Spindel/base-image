To build the rootfs.tar.xz do the following on an armhf machine running debian
or ubuntu:

$ debootstrap stable /root/rootfs
$ chroot /root/rootfs
$ echo  "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list 
$ apt-get update
$ apt-get install -y docker.io
$ apt-get clean; exit
$ cd /root/rootfs  ; tar cvzf /root/rootfs.tar.gz . 

