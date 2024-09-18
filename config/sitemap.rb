# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://yochiyochi.onrender.com/"
SitemapGenerator::Sitemap.sitemaps_host = "https://#{ENV['AWS_S3_BUCKET']}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.public_path = 'tmp/'  # 一時保存用
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'  # S3上の保存ディレクトリ
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new


SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #トップページ
  add root_path, :priority => 1.0, :changefreq => 'dialy'

  #施設一覧
  add facilities_path, :priority => 0.8, :changefreq => 'dialy'

  #イベント一覧
  add events_path, :priority => 0.8, :changefreq => 'dialy'

  #問い合わせ
  add 'https://docs.google.com/forms/d/e/1FAIpQLSeMWLzuaz2_GmcI_bxL3rbYwFuRaLuLA1M-fI-TImID8-RQOw/viewform?embedded=true',
      :priority => 0.5,
      :changefreq => 'dialy'
  #利用規約
  #プライバシーポリシー

  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  #施設詳細
  Facility.find_each do |facility|
    add facility_path(facility),
        :changefreq => 'dialy',
        :priority => 0.9,
        :lastmod => facility.updated_at
  end

  #イベント詳細
  Event.find_each do |event|
    add event_path(event),
        :changefreq => 'dialy',
        :priority => 0.9,
        :lastmod => event.updated_at
  end
end
