class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.string :name
			t.integer :user_id

      t.timestamps
    end
		add_index :boxes, [:user_id, :created_at]
  end
end
