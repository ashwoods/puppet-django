

define django::resource::virtualenv(
  $ensure             = present,
  $location           = undef,
  $requirements       = undef,
  $project            = undef,
  #$proxy_read_timeout = $nginx::params::nx_proxy_read_timeout,
) {


  exec {"virtualenv-${name}":
    user => $user,
    command  => "/usr/local/pythonbrew/pythons/Python-2.7.2/bin/virtualenv ${location}",
    creates  => $location,
    require => Pythonbrew::Version['2.7.2'],
  }

  exec {"requirements-${name}":
      user => $user,
      command => "yes w | /home/vagrant/.virtualenvs/submitz/bin/pip install -r /vagrant/stable.pip",
      require => Exec["virtualenv-${name}"],
               timeout => "0",
        }

  exec {"pip-install-${name}":
    user => $user,
    command => "${location}/bin/pip install -e ${project}",
    require => Exec['requirements-${name}'],
  }
}
