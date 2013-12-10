# Class rngd::params
#
# set variables according to OS and Hardware
#
# Martin Alfke <tuxmea@gmail.com>
#
class rngd::params {
    case $::osfamily {
        'RedHat': {
            $rngdpkg = 'rng-tools'
            $rngdconfig = '/etc/sysconfig/rngd'
            $rngdsrv = 'rngd'
        }
        'Debian': {
            $rngdpkg = 'rng-utils'
            $rngdconfig = '/etc/default/rngd'
            $rngdsrv = 'rngd'
        }
        default: { fail("Your OS (${::operatingsystem}) is not supported.") }
    }
    case $::processor0 {
        /^Intel/: {
            $rngmodule = 'intel-rng'
        }
        /^AMD/: {
            $rngmodule = 'amd-rng'
        }
        /^VIA/: {
            $rngmodule = 'via-rng'
        }
        /^QEMU/: {
            $rngmodule = 'virtio-rng'
        }
        default: {
            $rngmodule = undef
        }
    }
}
