# Class: django::package
#
# This module manages django requirements package installation
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly

class django::package {

    anchor { 'django::package::begin': }
    anchor { 'django::package::end': }

    if !defined(Package['python-virtualenv'])         { package {'python-virtualenv': ensure => installed }}
    if !defined(Package['git-core'])                  { package {'git-core': ensure => installed }}
    if !defined(Package['mercurial'])                 { package {'mercurial': ensure => installed }}
    if !defined(Package['postgresql-server-dev-9.1']) { package {'postgresql-server-dev-9.1': ensure => installed }}
    if !defined(Package['build-essential'])           { package {'build-essential': ensure => installed }}
    if !defined(Package['python-dev'])                { package {'python-dev': ensure => installed }}

}

