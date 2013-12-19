# Summary 
Bootstrap project used to setup environments during my R&D activities and 'pet' projects

## OS
I usually use ubuntu neither 12.04.3 LTS (Precise Pangolin), Ubuntu 12.10 (Quantal Quetzal).
I am also adapting 13.10 (Saucy Salamander), but it still has some incompatibilities on packages.

## Software installed
Once you cloned repository, run init.sh

By default, it will install bootstrap software packages listed below:
 
- Git
- Ruby 1.9.3 (dev)
- OpsCode CHEF [https://wiki.opscode.com/display/chef/Home](https://wiki.opscode.com/display/chef/Home)
- Librarian-chef [https://github.com/applicationsonline/librarian-chef](https://github.com/applicationsonline/librarian-chef)
- Berkshelf (for Vagrant based provisioning) [http://berkshelf.com/](http://berkshelf.com/)

## Directories purpose

### cookbooks
Official cookbooks for widely used software


### cookbook-project
I use this directory to checkout cookbooks that are not available for the public, and are specifically related to project specific environment configuration

### databags
Directory contains optional project specific file artifacts for cookbooks.

### environments
Contains preferences to package versions, vendors and machine wide configuraiton for packages installed


### nodes
Contains instructions to configure predefined set of the software on specific workstation basing on it's role (lamp box, java box, big data box, MEAN box, etc.

### roles
Contains combination of recipes (roles) to configure workstation for predefined needs.
By default roles are:

- gui - installs set of handy tools, so that workstation can be used for GUI development
- sql - installs set of tools for efficient work with MySQL (Percona, MariaDB) box
- lamp_debug - configures workstation for lamp development

## How to use 

Usually Vagrant does this for you. Manual steps are:

*sudo chef-solo -c solo.rb -j nodes/nodename.json*


## Read more

[http://docs.opscode.com/](http://docs.opscode.com/)
