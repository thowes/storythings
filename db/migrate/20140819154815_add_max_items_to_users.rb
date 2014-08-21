class AddMaxItemsToUsers < ActiveRecord::Migration
  def change
		add_column :users, :max_items, :integer, default: 10
		add_column :users, :player_type, :string, default: 'Nomad'
		add_column :users, :player_level, :integer, default: 0
  end
end
