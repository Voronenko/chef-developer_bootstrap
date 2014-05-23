#!/bin/sh

#recommended for 12.04

CHEF_BINARY=chef-solo
#Is system already configured for chef?
if ! command -v $CHEF_BINARY > /dev/null 2>&1; then
  # Don't prompt during installs
  export DEBIAN_FRONTEND=noninteractive

  #install git if not present
  if ! command -v git > /dev/null 2>&1; then
    sudo apt-get install -y --force-yes git
  fi
  
  #chef makes use of recent ruby
  sudo apt-get install -y ruby1.9.1-dev
  
  sudo apt-get update
  sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev
  
  #berk
  echo installing berk
  sudo gem install berkshelf --no-ri --no-rdoc
  #librarian
  echo installing librarian gem... Please be patient, takes a while.
  sudo gem install librarian-chef --no-ri --no-rdoc
  echo Initializing cookbooks
  librarian-chef install

fi 


echo proceed with:   "$CHEF_BINARY" -c solo.rb -j "nodes/nodename.json"
