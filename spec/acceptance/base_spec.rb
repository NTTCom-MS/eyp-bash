require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'bash class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'bash':
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe file('/etc/profile.d/history.sh') do
      it { should be_file }
      its(:content) { should match 'puppet managed file' }
      its(:content) { should match 'HISTTIMEFORMAT="%d%m%y %H%M%S -> "' }
      its(:content) { should match 'HISTFILESIZE="1000000"' }
      its(:content) { should match 'HISTSIZE="1000000"' }
      its(:content) { should match 'HISTCONTROL="ignoredups"' }
    end

  end
end
