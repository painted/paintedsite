class Tag < ActiveRecord::Base
	has_and_belongs_to_many :categories
	validates :name, uniqueness: true

	def to_param
		name
	end
end
