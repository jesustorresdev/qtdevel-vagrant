# videovigilancia-vagrant

Vagrantfile and Ansible playbook for setting up Qt Creator in a Vagrant virtual
machine.

## About Vagrant and Ansible

Vagrant is a tool to create and configure reproducible and portable development
environments using virtual machines. These are specified through Vagrantfiles,
in a similar manner as ```make``` uses Makefiles.

The created virtual machines must be provisioned with all the software that
we need. So here is where we use Ansible, a configuration management tool written
in Python.

Ansible is a tool used to streamline the task of configuring and maintaining
company's servers, so the same playbook and roles can be used to automatically
provision and configure real machines, no only virtual machines used in
development.

## Requirements

Mainly, you need Vagrant and some additional plugins:

 * Virtualbox (our Vagrantfile has only been tested with this VM provider)
 * Vagrant >= 1.8.2

## Build a virtual machine

To create the Vagrant virtual machine, just run:

    $ vagrant up

from the directory of this repository, where is the Vagrantfile.

If the previous command is successful, remember you can manage the new virtual
machine using the following Vagrant commands:

 * `vagrant halt`, to stop the virtual machine.
 * `vagrant destroy`, to remove the virtual machine.
 * `vagrant ssh`, to enter the virtual machine.

## Software provisioned

By default, the next lines in `provisioning/playbook.yml` will install and
configure Ubuntu Desktop and Qt Creator with the default components:

```yaml
  roles:
    - common
    - ubuntudesktop
    - git
    - qtdevel
```

## Access to private repositories on Github

The SSH agent forwarding is enabled in the Vagrantfile 

```ruby
    config.ssh.forward_agent = true
```
so you only have to add your key to the SSH agent

    $ ssh-add

before build a new virtual machine with `vagrant up`.

# Copyright and license

Copyright (c) 2014-2016, Jesús Torres &lt;<jmtorres@ull.es>&gt;. Use of this
source code is governed by a BSD-style license that can be found in the LICENSE
file.
