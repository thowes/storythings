class Experience < ActiveRecord::Base
	belongs_to :user
	belongs_to :quest
	validates :title, presence: true, length: { maximum: 100, minimum: 10 }
end
