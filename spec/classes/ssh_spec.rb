require 'spec_helper'
describe 'test::ssh' do

  context 'with defaults for all parameters' do
    it { should contain_class('test::ssh') }
    it { should contain_package('openssh-server') }
    it { should contain_service('sshd') }
  end
end
