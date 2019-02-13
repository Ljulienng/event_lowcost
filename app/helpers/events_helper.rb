module EventsHelper

	def end_date
    @event = Event.find(params[:id])
    k = (@event.duration).to_i
    end_daate = @event.start_date + k.minutes
    return end_daate
  end

end
