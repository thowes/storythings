class Experience < ActiveRecord::Base
	#belongs_to :user
	validates :title, presence: true, length: { maximum: 100, minimum: 10 }
end
