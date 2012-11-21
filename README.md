vagrant_examples
================

Examples using vagrant and chef to setup basic boxes

Setup
-----
* [install virtual box] (https://www.virtualbox.org/wiki/Downloads)
* [install vagrant] (http://downloads.vagrantup.com/)

Examples
--------
From the command line run:

    vagrant box add ubuntu http://dl.dropbox.com/u/4031118/Vagrant/ubuntu-12.04.1-server-i686-virtual.box

This command will download a ubuntu box to your local machine and associate it with the alias *ubuntu*.

Change directory to the boxes directory and pick one of its subdirectories for the example to try

* hello
    a hello world recipe showing how to set inputs in the node
* ruby
    a default ruby setup mapping the vender_artifacts directory to a directory inside the virtual machine

To try out the recipes just run the command `vagrant up` from the directory in question


See also
--------
* http://vagrantup.com
* You can pick from a list of available pre-canned boxes at http://www.vagrantbox.es
