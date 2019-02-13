class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	after_create :welcome_send


	has_many :attendances
	has_many :events, through: :attendances
  has_many :events_created, foreign_key: 'admin_id', class_name: "Event"


	def welcome_send
		UserMailer.welcome_email(self).deliver_now
	end

	def reset_password_instructions
		UserMailer.reset_password_instructions(self).deliver_now
	end
		
	def is_participant?(event)
		attendance = Attendance.where(event_id: event.id)
		attendance.each do |attendance|
			if self.id.to_i == attendance.user_id.to_i
				return true			
			end
		end
			return false
	end

end
