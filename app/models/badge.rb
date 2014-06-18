class Badge < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 80 }
end
