#!/bin/bash -eux

# Install EPEL repository.
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Install Ansible.
yum -y install ansible python-setuptools
