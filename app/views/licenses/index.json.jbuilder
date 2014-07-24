json.array!(@licenses) do |license|
  json.extract! license, :name, :price
  json.url license_url(license, format: :json)
end