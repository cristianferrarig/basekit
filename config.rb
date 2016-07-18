#
# BASEKIT CONFIG
# Version 0.1
#
# 1. Assets
# 2. Directories
# 3. Layouts
# 4. Extensions
# 5. Options
# 6. Eviroments
# 7. Deploy
#



# 1. Assets
after_configuration do
  sprockets.append_path "#{root}/assets/stylesheets"
  sprockets.append_path "#{root}/assets/javascripts"
  sprockets.append_path "#{root}/vendor/bower"
# sprockets.import_asset 'jquery'
# sprockets.import_asset 'hashgrid'
end



# 2. Directories
set :source,         "docs"
set :build_dir,      "build"

set :data_dir,       "config/data"
set :locales_dir,    "config/locales"
set :helpers_dir,    "helpers"

# Relative to source
set :layouts_dir,    "../layouts"
set :partials_dir,   "partials"

set :css_dir,        "assets/stylesheets"
set :js_dir,         "assets/javascripts"
set :images_dir,     "assets/images"
set :fonts_dir,      "assets/fonts"



# 3. Layouts
set :layout,         "default"
# page '/*', layout: "default"



# 4. Extensions
activate :autoprefixer
activate :directory_indexes
activate :i18n, :data => "config/locales"
activate :syntax do |syntax|
  syntax.css_class     = "code-highlight"
  syntax.line_numbers  = true
end
# activate :syntax, :line_numbers => true
# activate :syntax, line_numbers: true, css_class: "code-highlight"
# set :relative_links, false
# set :show_exceptions, true



# 5. Options
# set :relative_links, false
# set :show_exceptions, true



# 6. Eviroments
configure :development do
  activate :livereload
  set :debug_assets, true
end

configure :build do
  # activate :imageoptim
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  # activate :asset_hash
  # activate :relative_assets
  # set :relative_links, false
end



# 7. Deploy
activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
end
