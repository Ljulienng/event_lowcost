class AttendancesController < ApplicationController

	def index
		@attendances = Event.find(params[:event_id]).attendances
	end
end
