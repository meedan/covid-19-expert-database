source "https://rubygems.org"

gem 'jekyll', '~> 3.0'
gem 'contentful_bootstrap'

group :jekyll_plugins do
  gem "jekyll-contentful-data-import", git: "https://github.com/meedan/jekyll-contentful-data-import"
  gem 'jekyll-seo-tag'
  gem 'jekyll-livereload'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.0" if Gem.win_platform?