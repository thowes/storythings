class AddQrlinkToItems < ActiveRecord::Migration
  def change
  	add_column :items, :qrlink, :string
    add_index  :items, :qrlink
  end
end
