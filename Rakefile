require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake/testtask' # Needed for
require 'rake/rdoctask' # tasks/rails
require 'tasks/rails' 
require 'sitemap_generator/tasks'  

desc 'Default: run spec tests.'
task :default => :spec

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = Dir.glob(['spec/sitemap_generator/**/*'])
  spec.rspec_opts = ['--backtrace']
end