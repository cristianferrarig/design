activate :autoprefixer
activate :directory_indexes
activate :syntax, :line_numbers => true

# ready do
#   sprockets.append_path File.join root, 'toolkit/assets'
#   sprockets.append_path File.join root, 'vendor/bower'
# end

after_configuration do
  sprockets.append_path "#{root}/lib/assets"
  sprockets.append_path "#{root}/vendor/bower"
#  sprockets.append_path File.join root, 'vendor/bower'
end

set :source,       "source"
set :build_dir,    "public"

set :data_dir,     "data"
set :locales_dir,  "locales"
set :helpers_dir,  "helpers"

# relative to source
set :layouts_dir,  "layouts"
set :partials_dir, "partials"

set :css_dir,      "assets/stylesheets"
set :js_dir,       "assets/javascripts"
set :images_dir,   "assets/images"
set :fonts_dir,    "assets/fonts"

set :layout,       "default"

# page '/*', layout: "default"

configure :development do
  activate :livereload
  set :debug_assets, true
end

# set :relative_links, false
# set :show_exceptions, true

configure :build do
  # activate :imageoptim
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  # activate :asset_hash
  # activate :relative_assets
  # set :relative_links, false
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
end
