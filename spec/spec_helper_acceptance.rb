require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'

run_puppet_install_helper

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet( "module install puppetlabs-stdlib" )
    options = { source: proj_root, module_name: 'dummy' }
    options[:version] = ENV['BEAKER_MOD_VERSION'] if ENV['BEAKER_MOD_VERSION']
    install_dev_puppet_module options
  end
end
