class Quest < ActiveRecord::Base
	has_ancestry
	validates :name, presence: true, length: { maximum: 80, minimum: 3 }
end
