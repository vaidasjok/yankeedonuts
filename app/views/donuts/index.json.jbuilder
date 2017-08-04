json.array!(@donuts) do |donut|
  json.extract! donut, :id, :title, :description
  json.url donut_url(donut, format: :json)
end
