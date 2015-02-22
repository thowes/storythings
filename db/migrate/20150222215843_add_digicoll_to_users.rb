class AddDigicollToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :digicoll, :integer, default: 0
    add_index  :users, :digicoll
  end
end
