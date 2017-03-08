#!/bin/bash -eux
# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-/root}";


yum install -y gcc cpp bzip2 libstdc++-devel kernel-devel kernel-headers

mkdir -p /tmp/vbox;
mount -o loop $HOME_DIR/VBoxGuestAdditions.iso /tmp/vbox;
sh /tmp/vbox/VBoxLinuxAdditions.run \
		|| echo "VBoxLinuxAdditions.run exited $? and is suppressed." \
				"For more read https://www.virtualbox.org/ticket/12479";
umount /tmp/vbox;
rm -rf /tmp/vbox;
rm -f $HOME_DIR/*.iso;

echo 'RES_OPTIONS="single-request-reopen"' >> /etc/sysconfig/network
echo 'Slow DNS fix applied (single-request-reopen)'
