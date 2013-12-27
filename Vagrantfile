# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
DEVELOPER_BOOTSTRAP_PATH = "./"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3306, host: 3316


  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  #
  config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  #Make sure berkshelf plugin for vagrant is installed
  #see https://github.com/berkshelf/vagrant-berkshelf
  config.berkshelf.enabled = true

  #

  
  #Make sure that box we have runs recent ruby version & appropriate chef version.
  #Use shell provisioner once if you use default box http://files.vagrantup.com/precise32.box
  config.vm.provision :shell, :path => DEVELOPER_BOOTSTRAP_PATH+"init_vagrant.sh"

# Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  config.vm.provision :chef_solo do |chef|

     chef.cookbooks_path = [DEVELOPER_BOOTSTRAP_PATH+"cookbooks", DEVELOPER_BOOTSTRAP_PATH+"cookbooks-project"]
     chef.roles_path = DEVELOPER_BOOTSTRAP_PATH+"roles"
     chef.data_bags_path = DEVELOPER_BOOTSTRAP_PATH+"databags"
     chef.environments_path=DEVELOPER_BOOTSTRAP_PATH+"environments"

     chef.environment="vagrant"

     chef.add_recipe "devbox"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  end

  
end
