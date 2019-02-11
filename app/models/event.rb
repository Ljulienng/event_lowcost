class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
	belongs_to :admin, class_name: "User"

	validates :start_date,presence: true

	validates :duration,
		presence: true,
		if: :{multiple_of_5}:true


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


  def multiple_of_5
    if duration % 5 == 0
      return true
    else  
      return false
    end
  end

end
