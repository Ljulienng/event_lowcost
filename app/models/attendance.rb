class Attendance < ApplicationRecord
	after_create :new_user

	belongs_to :user
	belongs_to :event


	def new_user
		AttendanceMailer.user_joined_email(self).deliver_now
	end
end
