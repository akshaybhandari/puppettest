require 'spec_helper_acceptance'

describe 'test class' do
  it "should work with no errors" do
    pp = "class { 'test': }"
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :expect_changes => true)

    pp = "class { 'test::file': }"
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :expect_changes => true)
  end
  describe file("/tmp/test.txt") do
    it { should be_file }
    it { should contain("test line") }
  end
  describe service("ssh") do
    it { should be_running }
    it { should be_enabled }
  end
end
