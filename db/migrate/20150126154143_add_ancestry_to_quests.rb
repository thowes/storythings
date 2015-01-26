class AddAncestryToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :ancestry, :string
    add_index  :quests, :ancestry
  end
end
