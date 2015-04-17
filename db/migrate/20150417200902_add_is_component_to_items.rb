class AddIsComponentToItems < ActiveRecord::Migration
  def change
  	add_column :items, :is_component, :boolean, default: false
		add_index  :items, :is_component
  end
end
