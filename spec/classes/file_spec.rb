require 'spec_helper'

describe 'test::file' do
  it { should contain_class('test::file') }
  it do
    should contain_file('/tmp/test.txt').with({
      'ensure' => 'present',
      'owner'  => 'root',
      'group'  => 'root',
      'mode'   => '0444',
    })
  end
end
