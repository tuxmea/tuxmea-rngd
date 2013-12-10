class rngd::params {
    case $::osfamily {
        'RedHat': {
            $rngdpkg = 'rng-utils'
            $rngdconfig = '/etc/sysconfig/rngd'
            $rngdsrv = 'rngd'
        }
        'Debian': {
            $rngdpkg = 'rng-tools'
            $rngdconfig = '/etc/default/rngd'
            $rngdsrv = 'rngd'
        }
        default: { fail("Your OS (${::operatingsystem}) is not supported.") }
    }
}
