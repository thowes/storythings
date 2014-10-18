json.array!(@quests) do |quest|
  json.extract! quest, :name, :type, :mother, :next, :prev
  json.url quest_url(quest, format: :json)
end