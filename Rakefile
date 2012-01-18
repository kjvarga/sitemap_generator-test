require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake/testtask' # Needed for
require 'rake/rdoctask' # tasks/rails
require 'tasks/rails'

desc 'Default: run spec tests.'
task :default => :spec

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--backtrace']
  t.spec_files = Dir.glob(['spec/sitemap_generator/**/*'])
end
