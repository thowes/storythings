class Quest < ActiveRecord::Base
	has_ancestry
	default_scope -> { order('id ASC') }
	validates :name, presence: true, length: { maximum: 80, minimum: 3 }
	validates :qtype, presence: true, length: { maximum: 10, minimum: 2 }
end
