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
    end
end
