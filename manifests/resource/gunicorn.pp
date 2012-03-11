
define django::resource::gunicorn(
  $ensure             = present,
  $project            = undef,
  $virtualenv         = undef,
  $port               = 9000,
  $workers            = 2,
  $user               = undef,
  $host               = '0.0.0.0'

) {

  include supervisor

  supervisor::service {"gunicorn-${name}":
    ensure          => running,
    enable          => true,
    command         => "${virtualenv}/bin/gunicorn_django -w ${workers} -b ${host}:${port}",
    chdir           => $project,
    user            => $user,
    autorestart     => true,
    redirect_stderr => true
   }

}
