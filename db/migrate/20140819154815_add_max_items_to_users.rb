class AddMaxItemsToUsers < ActiveRecord::Migration
  def change
		add_column :users, :max_items, :integer, default: 10
  end
end
