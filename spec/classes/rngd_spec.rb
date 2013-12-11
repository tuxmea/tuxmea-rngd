require 'spec_helper'
require 'rspec-puppet'

describe 'rngd' do
    context 'on RedHat' do
        let (:facts) {{
            :osfamily => 'RedHat'
        }}
        it { should contain_class('rngd') }
        it { should contain_class('rngd::params') }
        it { should contain_package('rng-tools') }
        it { should contain_file('/etc/sysconfig/rngd').with_content(/EXTRAOPTIONS/) }
        it { should contain_service('rngd').with({
            'ensure' => 'running',
            'enable' => 'true'
        })}
        context 'on Intel CPU' do
            let(:facts) {{
                :osfamily => 'RedHat',
                :processor0 => 'Intel Mhagony'
            }}
            it { should contain_exec('rngmodule').with_command(/intel-rng/) }
        end
        context 'on AMD CPU' do
            let(:facts) {{
                :osfamily => 'RedHat',
                :processor0 => 'AMD Mhagony'
            }}
            it { should contain_exec('rngmodule').with_command(/amd-rng/) }
        end
        context 'on VIA CPU' do
            let(:facts) {{
                :osfamily => 'RedHat',
                :processor0 => 'VIA Mhagony'
            }}
            it { should contain_exec('rngmodule').with_command(/via-rng/) }
        end
        context 'on QEMU CPU' do
            let(:facts) {{
                :osfamily => 'RedHat',
                :processor0 => 'QEMU Mhagony'
            }}
            it { should contain_exec('rngmodule').with_command(/virtio-rng/) }
        end
        context 'on other CPU' do
            let(:facts) {{
                :osfamily => 'RedHat',
                :processor0 => 'foo'
            }}
            it { should_not contain_exec('rngmodule') }
        end
    end
    context 'on Debian' do
        let(:facts) {{
            :osfamily => 'Debian'
        }}
        it { should contain_class('rngd') }
        it { should contain_class('rngd::params') }
        it { should contain_package('rng-utils') }
        it { should contain_file('/etc/default/rngd').with_content(/EXTRAOPTIONS/) }
        it { should contain_service('rngd').with({
            'ensure' => 'running',
            'enable' => 'true'
        })}
        context 'on Intel CPU' do
            let(:facts) {{
                :osfamily => 'Debian',
                :processor0 => 'Intel Mahagony'
            }}
            it { should contain_exec('rngmodule').with_command(/intel-rng/) }
        end
        context 'on AMD CPU' do
            let(:facts) {{
                :osfamily => 'RedHat',
                :processor0 => 'AMD Mhagony'
            }}
            it { should contain_exec('rngmodule').with_command(/amd-rng/) }
        end
        context 'on VIA CPU' do
            let(:facts) {{
                :osfamily => 'RedHat',
                :processor0 => 'VIA Mhagony'
            }}
            it { should contain_exec('rngmodule').with_command(/via-rng/) }
        end
        context 'on QEMU CPU' do
            let(:facts) {{
                :osfamily => 'RedHat',
                :processor0 => 'QEMU Mhagony'
            }}
            it { should contain_exec('rngmodule').with_command(/virtio-rng/) }
        end
        context 'on other CPU' do
            let(:facts) {{
                :osfamily => 'RedHat',
                :processor0 => 'foo'
            }}
            it { should_not contain_exec('rngmodule') }
        end
    end
end
