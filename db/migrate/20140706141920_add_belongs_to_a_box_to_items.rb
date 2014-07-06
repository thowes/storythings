class AddBelongsToABoxToItems < ActiveRecord::Migration
  def change
  	add_column :items, :box_id, :integer, :default => 0
		add_index  :items, :box_id
  end
end