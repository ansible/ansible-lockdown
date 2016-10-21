#!/bin/bash
yum -y install wget
# create vagrant user and group
/usr/sbin/groupadd vagrant
/usr/sbin/useradd vagrant -g vagrant -G wheel -d /home/vagrant -c "vagrant"
# add vagrant's public key - user can ssh without password
mkdir -pm 700 /home/vagrant/.ssh
wget -O /home/vagrant/.ssh/authorized_keys -q --no-check-certificate https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# give sudo access (grants all permissions to user vagrant)
echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# set password
echo "vagrant" | passwd --stdin vagrant
