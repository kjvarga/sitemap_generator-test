require 'fileutils'
ENV['RAILS_ENV'] = 'test'

# Update the vendored plugin
gem_path    = File.expand_path(File.join(File.dirname(__FILE__), '../../sitemap_generator'))
vendor_path = File.expand_path(File.join(File.dirname(__FILE__), '../vendor/plugins/sitemap_generator-1.2.3'))
FileUtils.rm_rf(vendor_path)
FileUtils.mkdir_p(vendor_path)
FileUtils.cp_r(Dir.glob([File.join(gem_path, "[A-Z]*"), File.join(gem_path, "{bin,lib,rails,templates,tasks}")]), vendor_path)

load(File.expand_path(File.join(File.dirname(__FILE__), '../', 'Rakefile')))

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

Spec::Runner.configure do |config|
  config.include(FileMacros)
  config.include(XmlMacros)
  config.include(SitemapMacros)

  config.after(:all) do
    clean_sitemap_files_from_rails_app
    copy_sitemap_file_to_rails_app(:create)
  end

  # Pass :focus option to +describe+ or +it+ to run that spec only
  # config.filter_run :focus => true
  # config.run_all_when_everything_filtered = true
end

module Helpers
  extend self

  # Invoke and then re-enable the task so it can be called multiple times.
  # KJV: Tasks are only being run once despite being re-enabled.
  #
  # <tt>task</tt> task symbol/string
  def invoke_task(task)
    Rake.send(:verbose, false)
    Rake::Task[task.to_s].invoke
    Rake::Task[task.to_s].reenable
  end
end
