json.array!(@quests) do |quest|
  json.extract! quest, :name, :qtype, :mother, :next_quest, :prev_quest
  json.url quest_url(quest, format: :json)
end