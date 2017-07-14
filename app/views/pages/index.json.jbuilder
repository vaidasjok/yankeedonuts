json.array!(@pages) do |page|
  json.extract! page, :id, :title, :slug, :parent, :description, :seo_title, :seo_description, :menu
  json.url page_url(page, format: :json)
end
