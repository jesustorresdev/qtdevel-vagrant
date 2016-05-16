# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/vivid64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "2048"

    ### Use VBoxManage to customize the VM.
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    ### Qt Creator doesn't currently work with 3D acceleration.
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
  end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

  ###
  ### Enable provisioning

  ###
  ### Copy the user Git configuration to the new VM.
  if File.exists? File.expand_path("~/.gitconfig")
    config.vm.provision "file" do |file|
      file.source = "~/.gitconfig"
      file.destination = "~/.gitconfig"
    end
  end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  ###
  ### If is available, Valgrant-omnibus is used to install Chef in
  ### provisioner-less boxes.
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = :latest
  end

  ###
  ### Valgrant-librarian-chef is used to download the required Chef cookbooks
  ### and its dependencies.
  unless Vagrant.has_plugin?("vagrant-librarian-chef")
    raise 'Vagrant-librarian-chef plugin is required!. Try "vagrant plugin install vagrant-librarian-chef" first' 
  end
  config.librarian_chef.cheffile_dir = "chef"
  ###
  ### Valgrant-librarian-chef is used to download the required Chef cookbooks
  ### and its dependencies.
  unless Vagrant.has_plugin?("vagrant-librarian-chef")
    raise 'Vagrant-librarian-chef plugin is required!. Try "vagrant plugin install vagrant-librarian-chef" first' 
  end
  config.librarian_chef.cheffile_dir = "chef"

  ###
  ### Somebody says it is more programmer friendly than Puppet
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path =  ["cookbooks", "chef/cookbooks"]
  #   chef.roles_path = "roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
    chef.log_level = :debug
    chef.add_recipe "apt"
    chef.add_recipe "timezone-ii"
    chef.add_recipe "keyboard"
    chef.add_recipe "locale"
    chef.add_recipe "ubuntu-desktop"
    chef.add_recipe "vim-default-editor"
    chef.add_recipe "vbox-guest-additions"
    chef.add_recipe "git"
    chef.add_recipe "github"
    chef.add_recipe "qtproject"
    # Some project specific development tools
    chef.add_recipe "videovigilancia-devel"
    #
    chef.json = {
      :desktop => {
  #        :session => "default",                 # Ubuntu Unity
        :session => "gnome-flashback-metacity", # Ubuntu Classic without effects
      },
      :keyboard => {
        :layout => "es",
      },
      :locale => {
        :language => "es",
        :territory => "ES",
      },
      :tz => "Atlantic/Canary"
    }
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  end

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision "chef_client" do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
