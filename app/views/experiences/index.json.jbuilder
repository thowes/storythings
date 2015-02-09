json.array!(@experiences) do |experience|
  json.extract! experience, 
  json.url experience_url(experience, format: :json)
end