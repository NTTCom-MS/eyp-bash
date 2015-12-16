require 'spec_helper'
describe 'bash' do

  context 'with defaults for all parameters' do
    it { should contain_class('bash') }
  end
end
