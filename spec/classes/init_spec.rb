require 'spec_helper'
describe 'test' do

  context 'with defaults for all parameters' do
    it { should contain_class('test') }
    it { should contain_notify('Hello All!!! Welcome to puppet demo') }
  end
end
