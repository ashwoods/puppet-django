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

    if !defined(Pythonbrew::Version['2.7.2']) {
        pythonbrew::version {'2.7.2':
            user => 'root',
        }
    }

    # Allow the end user to establish relationships to the "main" class
    # and preserve the relationship to the implementation classes through
    # a transitive relationship to the composite class.
    anchor{ 'django::begin':
        #before => Class['django::package'],
        #notify => Class['django::service'],
      }

    anchor { 'nginx::end':
        #require => Class['django::service'],
    }


    #    exec {"virtualenv":
    #            user => 'vagrant',
    #            command  => "/usr/local/pythonbrew/pythons/Python-2.7.2/bin/virtualenv /home/vagrant/.virtualenvs/submitz",
    #            creates  => "/home/vagrant/.virtualenvs/submitz",
    #            require => Pythonbrew::Version['2.7.2'],
    #    }

    #    file { "/home/vagrant/submitz":
    #            ensure => link,
    #            target => "/vagrant",
    #    }

    #    exec {"requirements.pip":
    #           user => 'vagrant',
    #           command => "yes w | /home/vagrant/.virtualenvs/submitz/bin/pip install -r /vagrant/stable.pip",
    #           require => Exec["virtualenv"],
    #           timeout => "0",
    #    }

    #    exec {"pip-install-project":
    #           user => 'vagrant',
    #           command => "/home/vagrant/.virtualenvs/submitz/bin/pip install -e /vagrant",
    #           require => Exec['requirements.pip'],
    #    }


}
