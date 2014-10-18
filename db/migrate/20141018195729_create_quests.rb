class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :name
      t.string :type
      t.integer :mother
      t.integer :next
      t.integer :prev

      t.timestamps
    end
  end
end
