activate :autoprefixer
activate :directory_indexes

# activate :syntax, line_numbers: true

activate :syntax do |syntax|
  syntax.css_class     = "code-highlight"
  syntax.line_numbers  = true
end

# activate :syntax,
#   css_class:     "sss",
#   line_numbers:  true,
#   start_line:    1,
#   inline_theme:  nil,
#   wrap:          true,
#   lexer_options: {}

after_configuration do
  sprockets.append_path "#{root}/vendor/basekit/assets/stylesheets"
  sprockets.append_path "#{root}/vendor/basekit/assets/javascripts"
  sprockets.append_path "#{root}/vendor/basekit/tools/stylesheets"
  sprockets.append_path "#{root}/vendor/basekit/ui/stylesheets"
  sprockets.append_path "#{root}/vendor/bower"
# sprockets.import_asset 'jquery'
# sprockets.import_asset 'hashgrid'
end

set :source,       "source"
set :build_dir,    "public"

set :data_dir,     "config/data"
set :locales_dir,  "config/locales"
set :helpers_dir,  "config/helpers"

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
  deploy.method       = :git
  deploy.build_before = true
end
