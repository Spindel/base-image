To build the rootfs.tar.xz do the following on an armhf machine running debian
or ubuntu:

$ debootstrap testing /root/rootfs
$ chroot /root/rootfs apt-get update
$ chroot /root/rootfs apt-get -y install docker.io
$ chroot /root/rootfs apt-get clean
$ cd /root/rootfs  ; tar cvzf /root/rootfs.tar.gz . 

