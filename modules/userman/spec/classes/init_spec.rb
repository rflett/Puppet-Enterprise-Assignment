require 'spec_helper'
describe 'userman' do

  context 'with defaults for all parameters' do
    it { should contain_class('userman') }
  end
end
