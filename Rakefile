require 'bundler/setup'
Bundler.require

desc 'Default: run spec tests.'
task :default => :spec

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = Dir.glob(['spec/**/*'])
  spec.rspec_opts = ['--backtrace']
end
