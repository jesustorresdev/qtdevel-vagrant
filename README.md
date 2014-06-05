# videovigilancia-vagrant

Vagrantfile and Chef recipes for setting up Qt Creator in a Vagrant virtual
machine.

## About Vagrant and Chef

Vagrant is a tool to create and configure reproducible and portable development
environments using virtual machines. These are specified through Vagrantfiles,
in a similar manner as ```make``` uses Makefiles.

The created virtual machines must be provisioned with all the software that
we need. So here is where we use Chef, a configuration management tool written
in Ruby.

Chef is a tool used to streamline the task of configuring and maintaining
company's servers, so the same recipes can be used to automatically provision
and configure real machines, no only virtual machines used in development.

## Requirements

Mainly, you need Vagrant and some additional plugins:

 * Virtualbox (our Vagrantfile has only been tested with this VM provider)
 * Vagrant >= 1.5
 * Vagrant-librarian-chef
 * Vagrant-omnibus (optional, if we are to use a Vagrant box with Chef
pre-installed. That is not the case with the default box in our Vagrantfile)

Vagrant-librarin-chef and vagrant-omnibus plugins could be easily installed from
Vagrant running:

    $ vagrant plugin install vagrant-omnibus
    $ vagrant plugin install vagrant-librarian-chef

from command line.

## Software provisioned

By default, the next lines in the Vagrantfile will install and configure
Ubuntu Desktop and download the Qt Creator installer:

```ruby
    chef.add_recipe "apt"
    ...
    chef.add_recipe "ubuntu-desktop"
    chef.add_recipe "vim-default-editor"
    ...
    chef.add_recipe "qt"
```

Currently, Qt Creator is not automatically installed because it doesn't support
unattended installations. But it is downloaded to the desktop, so we can easily
run the installer.

## Access to private repositories on Github

The SSH agent forwarding is enabled in the Vagrantfile 

```ruby
    config.ssh.forward_agent = true
```
so you only have to add your key to the SSH agent

    $ ssh-add

before build a new virtual machine.

## Build a virtual machine

To create the Vagrant virtual machine, just run:

    $ vagrant up 

from the directory of this repository.
