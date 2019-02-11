class User < ApplicationRecord
	has_many :events
	has_many :attendances
	validates :first_name, presence true
	validates :last_name, presence true
	validates :description, presence true
end
