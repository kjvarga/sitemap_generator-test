require 'bundler/setup' 
Bundler.require
Combustion.initialize!
Combustion::Application.load_tasks

desc 'Default: run spec tests.'
task :default => :spec

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = Dir.glob(['spec/sitemap_generator/**/*'])
  spec.rspec_opts = ['--backtrace']
end
