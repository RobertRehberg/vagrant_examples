vagrant_examples
================

Examples using vagrant and chef to setup basic boxes

Setup:
------
* install virtual box https://www.virtualbox.org/wiki/Downloads
* install vagrant http://downloads.vagrantup.com/

you can pick from available pre-canned boxes at http://www.vagrantbox.es

to get your own plain ubuntu box (and for the examples contained herein) run this on the command line:

* vagrant box add ubuntu http://dl.dropbox.com/u/4031118/Vagrant/ubuntu-12.04.1-server-i686-virtual.box

drop to a command line inside the boxes directory and pick one of the subdirectories for the example to try out:

* hello is a simple hello world recipe showing how to set inputs in the node
* ruby is doing our default ruby ubuntu setup by mapping the vender_artifacts directory

run the command '''vagrant up''' from the directory in question