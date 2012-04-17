# Class: django
#
# This module manages django installs.
#
# Parameters:
#
# There are no default parameters for this class. All module parameters are managed
# via the django::params class
#
# Actions:
#
# Requires:
#  puppetlabs-stdlib - https://github.com/puppetlabs/puppetlabs-stdlib
#
#
#  stdlib
#    - puppetlabs-stdlib module >= 0.1.6
#    - plugin sync enabled to obtain the anchor type
#
# Sample Usage:
#
# The module works with sensible defaults:
#
# node default {
#   include django
# }
class django {

    if !defined(Class['stdlib']) {
        class { 'stdlib': }
    }

    class {'django::package': }


    # Allow the end user to establish relationships to the "main" class
    # and preserve the relationship to the implementation classes through
    # a transitive relationship to the composite class.
    anchor{ 'django::begin':
        before => Class['django::package'],
        #notify => Class['django::service'],
      }

    anchor { 'django::end':
        #require => Class['django::service'],
    }
}
