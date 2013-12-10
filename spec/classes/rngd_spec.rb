require 'spec_helper'
require 'rspec-puppet'

describe 'rngd' do
    context 'on RedHat' do
        let (:facts) {{
            :osfamily => 'RedHat'
        }}
        it { should contain_class('rngd') }
        it { should contain_class('rngd::params') }
    end
    context 'on Debian' do
        let(:facts) {{
            :osfamily => 'Debian'
        }}
        it { should contain_class('rngd') }
        it { should contain_class('rngd::params') }
    end
end
