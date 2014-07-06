class Item < ActiveRecord::Base
	belongs_to :user
	has_ancestry
	#belongs_to :box, :class_name => "Item", :foreign_key => "item_box_id"
	#has_many :things, :class_name => "Item", :foreign_key => "item_box_id"
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 80 }
	validates :user_id, presence: true
end