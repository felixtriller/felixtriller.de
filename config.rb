Time.zone = 'Europe/Berlin'

set :sass_source_maps, true

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

set :relative_links, true

set :markdown_engine, :kramdown
set :markdown, input: 'GFM', smartypants: true

set :layout, 'page'

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :directory_indexes
activate :syntax, css_class: 'syntax'
# activate :automatic_image_sizes
activate :automatic_alt_tags
activate :meta_tags

activate :sprockets
sprockets.append_path File.join(root, 'node_modules')

activate :autoprefixer do |config|
  config.browsers = ['last 2 versions']
end

activate :blog do |blog|
  blog.sources              = 'journal/{year}-{month}-{day}-{title}.html'
  blog.permalink            = '{year}/{title}.html'
  blog.layout               = 'article'
  blog.default_extension    = '.md'
  blog.generate_day_pages   = false
  blog.generate_month_pages = false
  blog.generate_tag_pages   = false
  blog.generate_year_pages  = false
  blog.paginate             = true
  blog.per_page             = 100
  blog.page_link            = 'page/{num}'
end

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css, inline: true
  activate :minify_javascript, inline: true
  activate :minify_html
end

activate :asset_hash
