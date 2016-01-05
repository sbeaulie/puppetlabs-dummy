require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

PuppetLint.configuration.fail_on_warnings = true
PuppetLint.configuration.send('relative')
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.send('disable_class_inherits_from_params_class')
PuppetLint.configuration.send('disable_documentation')
PuppetLint.configuration.send('disable_single_quote_string_with_variables')
PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp"]

desc 'Generate pooler nodesets'
task :gen_nodeset do
  require 'beaker-hostgenerator'
  require 'securerandom'
  require 'fileutils'

  agent_target = ENV['TEST_TARGET']
  if agent_target
    master_target = ENV['MASTER_TEST_TARGET'] || 'redhat7-64m'
    targets = "#{master_target}-#{agent_target}"
    cli = BeakerHostGenerator::CLI.new([targets])
    nodeset_dir = "tmp/nodesets"
    nodeset = "#{nodeset_dir}/#{targets}-#{SecureRandom.uuid}.yaml"
    FileUtils.mkdir_p(nodeset_dir)
    File.open(nodeset, 'w') do |fh|
      fh.print(cli.execute)
    end
    puts nodeset
  else
    puts "Please set the TEST_TARGET environment variable to use this task"
    exit 1
  end
end
