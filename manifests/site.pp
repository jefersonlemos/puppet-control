## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

$test_top_scope = "the top scope"

#node 'jeferson-santos4.mylabserver.com', 'jeferson-santos2.mylabserver.com' {
#	notify { "This is a definition of two nodes in a line": }
#	include ntp
#}

node /^jeferson-santos4/ {
   notify {"This is a node definition usign regex": }
}

node 'jeferson-santos1.mylabserver.com' {
  include pe_repo::platform::el_6_x86_64
  include pe_repo::platform::ubuntu_1204_amd64
  class { 'ntp':  }
  }

node default {
  $test_top_scope = "this is inside default node "
  $node_scope_var = "second Node Scope inside default node"
  notify { "test_top_scope": 
    message => "this is a top scope variable ${test_top_scope}"
  
  }
  #  notify {"This is the default node": }
#  class { 'ntp': }
}
node 'jeferson-santos2.mylabserver.com' {
  # class { 'ssh': }
}
