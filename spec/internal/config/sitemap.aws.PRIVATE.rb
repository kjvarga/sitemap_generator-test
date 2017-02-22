# ENV['AWS_SECRET_ACCESS_KEY'] = '+LExCoDEOaV25NjBZxywmtIF0R+QWhkKRN1YQklE'
# ENV['AWS_ACCESS_KEY_ID'] = 'AKIAJWXC4RO4FI37TMJQ'
ENV['FOG_DIRECTORY'] = 'sitemap_generator'
ENV['FOG_PROVIDER'] = 'AWS'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new
SitemapGenerator::Sitemap.default_host = "http://www.example.com"
SitemapGenerator::Sitemap.create do
  add "/merchant_path", :host => "https://www.example.com"
end
