class AddQrlinkToItems < ActiveRecord::Migration
  def change
  	add_column :items, :qrlink, :string, default: "http://storythin.gs/def"
    add_index  :items, :qrlink
  end
end
