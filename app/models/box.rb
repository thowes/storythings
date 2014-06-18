class Box < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 80 }
	validates :user_id, presence: true
end