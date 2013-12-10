root = File.absolute_path(File.dirname(__FILE__))

file_cache_path  root + '/tmp'
cookbook_path    [ root + '/cookbooks', root + '/cookbooks-project' ]
data_bag_path    root + '/databags'
environment_path root + '/environments'
role_path        root + '/roles'

environment      'development'
