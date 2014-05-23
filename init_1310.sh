#!/bin/sh

#recommended for 13.10

sudo apt-get update

sudo apt-get install ruby2.0 ruby2.0-dev build-essential \
  libssl-dev zlib1g-dev ruby-switch
  
  
sudo ruby-switch --set ruby2.0  


curl -L https://www.opscode.com/chef/install.sh | sudo bash

#librarian
echo installing librarian gem... Please be patient, takes a while.
sudo gem install librarian-chef --no-ri --no-rdoc

#conflicts with berk. No berk installed for manual box conf.

echo Initializing cookbooks
librarian-chef install
