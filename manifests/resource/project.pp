

define django::resource::project(
  $ensure             = present,
  $location           = undef,
  $user               = undef,
  $source             = undef
) {


  exec {"git-clone-${name}":
    user => $user,
    command  => "git clone --recursive ${source} ${location}",
    creates  => $location,
    require => Package['git-core'],
  }

  exec {"git-pull-${name}":
      user    => $user,
      cwd     => $location,
      command => "git reset && git pull && git submodule init && git submodule update",
      require => Exec["git-clone-${name}"],
  }



}
