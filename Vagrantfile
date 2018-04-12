# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  install_docker = %Q{
    if [ ! $(which docker) ]; then
      sudo apt update
      sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
      sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
      sudo apt update
      sudo apt install -y docker-ce
      sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
    else
      echo "docker already installed."
    fi
  }

  download_docker_binaries = %Q{
    if [ ! -d /opt/docker/ ]; then
      wget https://download.docker.com/linux/static/stable/x86_64/docker-17.09.0-ce.tgz 
      sudo tar -xvf docker-17.09.0-ce.tgz -C /opt/
    fi
  }

  # Set this to false if you don't want to install .NET Core on the VM
  should_install_dotnet_cli = false

  install_dotnet_cli = %Q{
    if [ ! $(which dotnet) ]; then
      curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
      sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
      sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
      sudo apt update
      sudo apt install dotnet-sdk-2.0.0 -y
     else
      echo "dotnet already installed."
    fi
  }

  config.vm.define "host1" do |node|
    node.vm.box = "ubuntu/xenial64"
    node.vm.hostname = "host1"
    node.vm.network "private_network", ip: "192.168.50.3"
    node.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', '5120']
    end

    node.vm.provision "shell", inline: "sudo apt purge apache2 -y"
    node.vm.provision "shell", inline: install_docker
    node.vm.provision "shell", inline: download_docker_binaries
    node.vm.provision "shell", inline: install_dotnet_cli if should_install_dotnet_cli
  end

end
