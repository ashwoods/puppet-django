

define django::resource::virtualenv(
  $ensure             = present,
  $location           = undef,
  $requirements       = undef,
  $project            = undef,
  $user               = undef
) {


  exec {"virtualenv-${name}":
    user => $user,
    command  => "virtualenv ${location}",
    creates  => $location,
    require => Package['python-virtualenv'],
  }

  exec {"requirements-${name}":
      user => $user,
      command => "yes w | ${location}/bin/pip install -r ${project}/${requirements}",
      require => Exec["virtualenv-${name}"],
               timeout => "0",
        }

  exec {"pip-install-${name}":
    user => $user,
    command => "${location}/bin/pip install -e ${project}",
    require => Exec["requirements-${name}"],
  }
}
