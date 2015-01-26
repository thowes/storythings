class Item < ActiveRecord::Base
	belongs_to :user
	has_ancestry
	default_scope -> { order('created_at ASC') }
	validates :name, presence: true, length: { maximum: 80, minimum: 3 }
	validates :user_id, presence: true
end