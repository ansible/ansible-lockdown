#!/bin/bash -eux
package-cleanup --oldkernels --count=1
yum -y erase gcc cpp libstdc++-devel kernel-devel kernel-headers yum-utils

yum -y clean all
rm -rf /var/cache/yum/x86_64
rm -rf /usr/lib/modules/3.10.0-229.el7.x86_64
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?

# Unlock vagrant user after applying the RHEL-STIG role.
passwd -u vagrant
restorecon -R -v /home/vagrant/.ssh

echo "==> Cleaning up temporary network addresses"
# Make sure udev doesn't block our network
if grep -q -i "release 6" /etc/redhat-release ; then
    rm -f /etc/udev/rules.d/70-persistent-net.rules
    mkdir /etc/udev/rules.d/70-persistent-net.rules
fi
rm -rf /dev/.udev/
if [ -f /etc/sysconfig/network-scripts/ifcfg-eth0 ] ; then
    sed -i "/^HWADDR/d" /etc/sysconfig/network-scripts/ifcfg-eth0
    sed -i "/^UUID/d" /etc/sysconfig/network-scripts/ifcfg-eth0
fi

service rsyslog stop
service auditd stop

logrotate -f /etc/logrotate.conf
rm -f /var/log/*-???????? /var/log/*.gz
rm -f /var/log/dmesg.old
rm -rf /var/log/anaconda
truncate -s0 /var/log/audit/audit.log
truncate -s0 /var/log/wtmp
truncate -s0 /var/log/lastlog
truncate -s0 /var/log/grubby
truncate -s0 ~root/.bash_history

# Whiteout the swap partition to reduce box size
# Swap is disabled till reboot
readonly swapuuid=$(/sbin/blkid -o value -l -s UUID -t TYPE=swap)
readonly swappart=$(readlink -f /dev/disk/by-uuid/"$swapuuid")
/sbin/swapoff "$swappart"
dd if=/dev/zero of="$swappart" bs=1M || echo "dd exit code $? is suppressed"
/sbin/mkswap -U "$swapuuid" "$swappart"

# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
