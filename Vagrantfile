# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # https://docs.vagrantup.com.
  #
  config.vm.provision "shell", path: "bootstrap.sh"
  # config.vm.provision "shell", inline: "apt-get update -y"
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  # boxes at https://atlas.hashicorp.com/search.
  #
  # hashicorp/precise64 A standard Ubuntu 12.04 LTS 64-bit box
  # hashicorp/precise32 A standard Ubuntu 12.04 LTS 32-bit box
  # debian/jessie64 Vanilla Debian 8 "Jessie"
  # debian/wheezy64 Vanilla Debian 7 "Wheezy"
  # centos/7 CentOS Linux 7 x86_64 Vagrant Box
  # centos/6 CentOS Linux 6 x86_64 Official Vagrant Box
  # freebsd/FreeBSD-11.0-CURRENT FreeBSD development snapshot builds.
  
  config.vm.define "foo" do |foo|
    foo.vm.box = "hashicorp/precise64"
    foo.vm.hostname = "foo"
    # foo.provider.customize ["modifyvm", :id, "--memory", "256"]
    foo.vm.network "private_network", ip: "192.168.50.4"
    foo.vm.network "public_network", ip: "172.20.6.47"
    # foo.vm.provision "shell", inline: "apt-get install emacs -y"
  end

  config.vm.define "bar" do |bar|
    bar.vm.box = "hashicorp/precise32"
    bar.vm.hostname = "bar"
    bar.vm.network "private_network", ip: "192.168.50.5"
  end
  
  # config.vm.box_check_update = false
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "256"
  end

end
