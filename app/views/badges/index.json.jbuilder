json.array!(@badges) do |badge|
  json.extract! badge, :name, :picture
  json.url badge_url(badge, format: :json)
end