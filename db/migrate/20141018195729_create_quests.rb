class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :name
      t.string :quest_type
      t.integer :mother
      t.integer :next_quest
      t.integer :prev_quest

      t.timestamps
    end
  end
end
