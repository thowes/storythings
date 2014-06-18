class Box < ActiveRecord::Base
	belongs_to :item
	default_scope -> { order('created_at DESC') }
	validates :description, presence: true, length: { maximum: 500 }
	validates :item_id, presence: true
end