require 'bundler/setup'
Bundler.require

SitemapGenerator::Sitemap.verbose = true
SitemapGenerator::Sitemap.default_host = 'http://example.com'
SitemapGenerator::Sitemap.create do
  add '/ruby', :lastmod => Time.now, :changefreq => 'always', :priority => 1.0
end
