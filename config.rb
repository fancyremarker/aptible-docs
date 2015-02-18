set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :partials_dir, 'partials'

activate :syntax, line_numbers: true
activate :directory_indexes

# Documentation
page '/documentation/*', layout: 'documentation.haml'

# Topics (Support)
data.topics.each do |title, category|
  category_url = "/topics/#{category.slug}"
  page "#{category_url}/index.html", layout: 'topics.haml'
  proxy "#{category_url}/index.html",
        'topics/category.html',
        locals: { category: category, title: title },
        ignore: true

  category.articles.each do |article|
    page "topics/#{article.url}.html", layout: 'topics.haml' do
      @category_url = category_url
      @category_title = title
      @title = article.title
    end
  end
end

# Quickstart (Getting Started)
# If the language has no or only one framework, skip category page and
# render language or framework document
page '/quickstart/*', layout: 'quickstart.haml'
data.quickstart.each do |title, language|
  next unless (language.frameworks || []).count > 1

  language_url = "/quickstart/#{language.slug}"
  proxy "#{language_url}/index.html",
        'quickstart/category.html',
        locals: { title: title, language: language },
        ignore: true
end

configure :build do
  # Exclude all Bower components except image assets
  ignore /bower_components(?!.*\/images\/)/

  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end
