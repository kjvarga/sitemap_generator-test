require 'rubygems'
require 'bundler/setup'
Bundler.require

require 'google/cloud/storage'

SitemapGenerator::Sitemap.adapter = SitemapGenerator::GoogleStorageAdapter.new(
  credentials: '/Users/kvarga/Google Drive/Development/Google Cloud Credentials/Sitemap Generator Test-91e657ac2fa2.json',
  project_id: 'sitemap-generator-test-263219',
  bucket: 'sitemaps-cloud-storage-test'
)

SitemapGenerator::Sitemap.default_host = "http://www.example.com"
SitemapGenerator::Sitemap.create do
  add '/contents', :priority => 0.7, :changefreq => 'daily'

  # add all individual articles
  (1..10).each do |i|
    add "/content/#{i}"
  end

  add "/merchant_path", :host => "https://www.example.com"
end
