json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :season, :description, :price
  json.url listing_url(listing, format: :json)
end
