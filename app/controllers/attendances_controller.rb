class AttendancesController < ApplicationController

	def index
		@attendances = Event.find(params[:event_id]).attendances
	end

  def new
    @event = Event.find(params[:event_id])
  end

  def create

  end
end
