class AddBoxesToItems < ActiveRecord::Migration
  def change
  	add_column :items, :is_a_box, :boolean, default: false
		add_index  :items, :is_a_box
  end
end