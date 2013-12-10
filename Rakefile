require 'rake'
require 'rake/tasklib'
require 'rspec/core/rake_task'
require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint'

desc "Run the tests"
RSpec::Core::RakeTask.new(:test) do |t|
  t.rspec_opts = ['--color']
  t.pattern = 'spec/*/*_spec.rb'
end

PuppetLint.configuration.ignore_paths = ["vendor/**/*.pp", "spec/**/*.pp"]

task :default => [:spec_prep, :test, :lint]
