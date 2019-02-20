class Event < ApplicationRecord

	belongs_to :admin, class_name: "User",optional: true
	has_many :attendances
	has_many :users, through: :attendances
	has_one_attached :image


	validates :start_date, presence: true

	validate :future_date


	validates :duration,
		presence: true,
		numericality: { only_integer: true, greater_than: 0  }

	validate :multiple_of_5

	validates :title,
		presence: true,
		length: { in: 5..140 }

	validates :description,
		presence: true,
		length: { in: 20..1000 }

	validates :price,
		presence: true,
		inclusion: {in: 1..1000}

	validates :location, presence: true


	private

  def multiple_of_5
  	errors.add(:duration, "must be a mutiple of 5") unless self.duration.to_i % 5 == 0
  end

	def future_date
    errors.add(:start_date, "Must be before end time") unless start_date.present? && start_date > Date.today
  end

end
