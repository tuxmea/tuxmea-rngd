class rngd {
    include rngd::params
    package { $rngd::params::rngdpkg:
        ensure => present,
    }
    file { $rngd::params::rngdconfig:
        ensure  => file,
        content => template('rngd/rngd.conf.erb'),
        require => Package[$rngd::params::rngdpkg],
    }
    service { $rngd::params::rngdsrv:
        ensure  => running,
        enable  => true,
        require => File[$rngd::params::rngdconfig],
    }
}
