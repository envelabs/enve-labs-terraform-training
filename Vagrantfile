# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "enve-labs-terraform-vm"
  config.vm.network :public_network, bridge: ''
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.synced_folder "./", "/home/vagrant/share"

  config.vm.provider :virtualbox do |vb|
    vb.name = "enve-labs-terraform-vm"
  end

  config.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates software-properties-common curl git unzip 
      curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
      unzip awscliv2.zip
      sudo ./aws/install
      rm -fr ./aws
      curl https://releases.hashicorp.com/terraform/0.15.3/terraform_0.15.3_linux_amd64.zip -o terraform_0.15.3_linux_amd64.zip && \
      unzip terraform_0.15.3_linux_amd64.zip && \
      mkdir -p .local/bin && \
      mv terraform .local/bin
      rm *.zip
  SHELL

end
