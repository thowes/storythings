class AddDigicollToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :components_allowed, :boolean, default: false
  	add_column :users, :digicoll, :integer, default: 0
    add_index  :users, :digicoll
  end
end
