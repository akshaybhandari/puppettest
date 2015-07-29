require 'spec_helper'

describe 'test::hiera' do
  it { should contain_class('test::hiera') }
  let(:node) { 'testnode' }
  it {
    should contain_package('ruby').with({
      'ensure' => 'present',
    })
  }
  it {
    should contain_package('libcurl').with({
      'ensure' => 'present',
    })
  }
end

#describe 'test::hiera' do
#  context 'test for dummy' do
#    let(:node) { 'dummy' }
#    it {
#      should contain_package('dummy').with({
#        'ensure' => 'present',
#      })
#    }
#  end
#end
