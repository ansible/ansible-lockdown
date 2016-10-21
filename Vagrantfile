# -*- mode: ruby -*-
# vi: set ft=ruby :
# To use these virtual machine install Vagrant and VirtuaBox or VMWare.
# vagrant up [centos6|fedora22|kalu|ubuntu41|coreos|windows]

Vagrant.configure(2) do |config|

  # provision.yml runs on a vagrant up, packer.yml runs on packer build.
  config.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "vagrant.ini"
    ansible.playbook = "vagrant.yml"
    ansible.verbose = "vv"
   end

  # Prefer VirtualBox before VMware Fusion
  config.vm.provider "virtualbox"
  config.vm.provider "vmware_fusion"

  config.vm.provider "virtualbox" do |virtualbox|
    virtualbox.gui = false
    virtualbox.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.vm.provider "vmware_fusion" do |vmware|
    vmware.gui = true
    vmware.vmx["memsize"] = "2048"
    vmware.vmx["numvcpus"] = "2"
  end

  config.ssh.insert_key = false
  config.vm.box_check_update = false
  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: false

  config.vm.define :centos6, autostart: true do |centos6_config|
    centos6_config.vm.box = "dockpack/centos6"
    centos6_config.vm.box_url ="https://atlas.hashicorp.com/dockpack/boxes/centos6"
    centos6_config.vm.network "forwarded_port", id: 'ssh', guest: 22, host: 2206, auto_correct: true
	centos6_config.vm.hostname = "centos6"
    centos6_config.vm.provider "vmware_fusion" do |vmware|
      vmware.vmx["memsize"] = "2048"
      vmware.vmx["numvcpus"] = "2"
    end
    centos6_config.vm.provider "virtualbox" do |vb|
      vb.name = "centos6"
			vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
  end

  config.vm.define :centos7, autostart: true do |centos7_config|
    centos7_config.vm.box = "dockpack/centos7"
    centos7_config.vm.box_url = "https://atlas.hashicorp.com/dockpack/boxes/centos7"
    centos7_config.vm.network "forwarded_port", id: 'ssh', guest: 22, host: 2207, auto_correct: true
    centos7_config.vm.provider "vmware_fusion" do |vmware|
      vmware.vmx["memsize"] = "2048"
      vmware.vmx["numvcpus"] = "2"
    end
    centos7_config.vm.provider "virtualbox" do |vb|
      vb.name = "centos7"
    end
  end
end
