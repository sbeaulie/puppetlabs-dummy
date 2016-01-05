# vim:ft=ruby

source ENV['GEM_SOURCE'] || "https://rubygems.org"

def location_for(place, version = nil)
  if place =~ /^(git[:@][^#]*)#(.*)/
    [fake_version, { :git => $1, :branch => $2, :require => false}].compact
  elsif place =~ /^file:\/\/(.*)/
    ['>= 0', { :path => File.expand_path($1), :require => false}]
  else
    [place, version, { :require => false}].compact
  end
end

group :development, :unit_tests do
  gem 'rspec-core', '3.1.7',     :require => false
  gem 'simplecov',               :require => false
  gem 'puppet_facts',            :require => false
  gem 'json',                    :require => false
  gem 'metadata-json-lint',      :require => false
  gem 'puppetlabs_spec_helper',  :require => false, :git => 'git://github.com/justinstoller/puppetlabs_spec_helper', :branch => 'compute_version'
  gem 'puppet-blacksmith',       :require => false, :git => 'git://github.com/justinstoller/puppet-blacksmith', :branch => 'env_vars_for_forge'
end

group :system_tests do
  gem 'beaker-rspec', *location_for(ENV["BEAKER_RSPEC_VERSION"])
  gem 'beaker', *location_for(ENV["BEAKER_VERSION"])
  gem 'serverspec',                                                    :require => false
  gem 'beaker-puppet_install_helper',                                  :require => false
  gem 'master_manipulator',                                            :require => false
  gem 'beaker-hostgenerator', *location_for(ENV["BEAKER_VERSION"])
end



gem 'facter', *location_for(ENV['FACTER_GEM_VERSION'])
gem 'puppet', *location_for(ENV['PUPPET_GEM_VERSION'])

