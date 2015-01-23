class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :name
      t.string :qtype, default: "QA"
      t.integer :mother, default: 0
      t.integer :next_quest, default: 0
      t.integer :prev_quest, default: 0

      t.timestamps
    end
  end
end
