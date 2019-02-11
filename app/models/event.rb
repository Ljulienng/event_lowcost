class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
	belongs_to :admin, class_name: "User"

	validates :start_date,
		presence: true,

	validates :duration,
		presence: true,

	validates :title,
		presence: true,
		length: { in: 5..140 }

	validates :description,
		presence: true,
		length: { in: 20..1000 }

	validates :price,
		presence: true,
	validates_inclusion_of :price, :in => 1..1000

	validates :location, presence: true

end
