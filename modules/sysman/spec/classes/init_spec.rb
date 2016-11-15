require 'spec_helper'
describe 'sysman' do

  context 'with defaults for all parameters' do
    it { should contain_class('sysman') }
  end
end
