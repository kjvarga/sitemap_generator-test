module SitemapMacros
  def with_max_links(num)
    original = ::SitemapGenerator::MAX_SITEMAP_LINKS
    ::SitemapGenerator.const_set(:MAX_SITEMAP_LINKS, num)
    yield
    ::SitemapGenerator.const_set(:MAX_SITEMAP_LINKS, original)
  end

  def this_root
    @this_root ||= File.expand_path(File.join(File.dirname(__FILE__), '../../'))
  end

  def rails_path(file)
    ::SitemapGenerator.app.root + file
  end

  def copy_sitemap_file_to_rails_app(extension)
    FileUtils.cp(File.join(this_root, "spec/files/sitemap.#{extension}.rb"), ::SitemapGenerator.app.root + 'config/sitemap.rb')
  end

  def delete_sitemap_file_from_rails_app
    FileUtils.remove(::SitemapGenerator.app.root + 'config/sitemap.rb')
  rescue
    nil
  end

  def clean_sitemap_files_from_rails_app
    FileUtils.rm_rf(rails_path('public/'))
    FileUtils.mkdir_p(rails_path('public/'))
  end
end
