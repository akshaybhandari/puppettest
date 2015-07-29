require 'beaker-rspec'
require 'spec_helper'

UNSUPPORTED_PLATFORMS = [ 'Windows', 'Solaris', 'AIX' ]

unless ENV['RS_PROVISION'] == 'no' or ENV['BEAKER_provision'] == 'no'
  # This will install the latest available package on el and deb based
  # systems fail on windows and osx, and install via gem on other *nixes

#  if default.is_pe?; then install_pe; else install_puppet( foss_opts ); end

  hosts.each do |host|
    install_puppet()
    on hosts, "mkdir -p #{host['distmoduledir']}"
  end
end

RSpec.configure do |c|
  # Project root
  c.mock_framework
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    #puppet_module_install(:source => proj_root, :module_name => 'test')
    
    hosts.each do |host|
      # Required for binding tests.
      scp_to host, "#{proj_root}/../test", "/etc/puppet/modules/.", {:ignore => [".bundle", ".git", ".idea", ".vagrant", ".vendor", "vendor", "acceptance", "bundle", "spec", "tests", "log", ".", ".."]}
      on host, puppet('module install puppetlabs-stdlib --version 4.6.0'), { :acceptable_exit_codes => [0,1] }
    end
  end
end
