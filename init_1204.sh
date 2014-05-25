#!/bin/sh

#recommended for 12.04

sudo apt-get install python-software-properties

sudo apt-add-repository ppa:brightbox/ruby-ng

sudo apt-get update

sudo apt-get install ruby2.1 ruby2.1-dev rubygems ruby-switch 

sudo ruby-switch --set ruby1.9.1

curl -L https://www.opscode.com/chef/install.sh | sudo bash

#librarian
echo installing librarian gem... Please be patient, takes a while.
sudo gem install librarian-chef --no-ri --no-rdoc

#conflicts with berk. No berk installed for manual box conf.

echo Initializing cookbooks
librarian-chef install
