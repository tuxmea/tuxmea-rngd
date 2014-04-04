# Class rngd
#
# Install and configure a rngd entropy daemon
#
# Martin Alfke <tuxmea@gmail.com>
#
class rngd {
    include rngd::params
    package { $rngd::params::rngdpkg:
        ensure => present,
    }
    file { $rngd::params::rngdconfig:
        ensure  => file,
        content => template('rngd/rngd.conf.erb'),
        require => Package[$rngd::params::rngdpkg],
        notify  => Service[$rngd::params::rngdsrv],
    }
    if ( $rngd::params::rngmodule and ! $::is_virtual) {
        exec { 'rngmodule':
            command => "/sbin/modprobe ${rngd::params::rngmodule}",
            unless  => "/sbin/lsmod | /bin/grep ${rngd::params::rngmodule}",
            before  => Service[$rngd::params::rngdsrv],
        }
    }
    service { $rngd::params::rngdsrv:
        ensure  => running,
        enable  => true,
    }
}
