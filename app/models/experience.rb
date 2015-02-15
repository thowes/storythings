class Experience < ActiveRecord::Base
	belongs_to :user
	belongs_to :quest
	validates :name, presence: true, length: { maximum: 100, minimum: 10 }
	validates :user_id, presence: true
end
