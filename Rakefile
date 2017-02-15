require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake/testtask' # Needed for
require 'rdoc/task' # tasks/rails
require 'tasks/rails'
require 'sitemap_generator/tasks'

desc 'Default: run spec tests.'
task :default => :spec

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--backtrace']
  t.spec_files = Dir.glob(['spec/sitemap_generator/**/*'])
end
