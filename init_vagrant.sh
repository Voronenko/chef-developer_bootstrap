#!/bin/sh
 echo [VS] Preconfiguring core packages for ruby & chef
  # Don't prompt during installs
  export DEBIAN_FRONTEND=noninteractive

  #box image could be completely obsolete
  sudo apt-get update >/dev/null

  #install git if not present
  if ! command -v git > /dev/null 2>&1; then
    sudo apt-get install -y --force-yes git
  fi
  
  #chef makes use of recent ruby
  sudo apt-get install -y ruby1.9.1-dev

  source /etc/environment
  echo "PATH=$PATH" > /etc/profile.d/vagrant_ruby.sh
  source /etc/profile.d/vagrant_ruby.sh
  #rm -rf /opt/vagrant_ruby    
  
  sudo apt-get update > /dev/null
  sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev

  #berk
  echo installing berk
  sudo gem install berkshelf --no-ri --no-rdoc
  

  #librarian
  echo installing librarian gem... Please be patient, takes a while.
  sudo gem install librarian-chef --no-ri --no-rdoc  

  exit 0

echo [/VS] Vagrant box updated to ruby 1.9.3-dev & chef
