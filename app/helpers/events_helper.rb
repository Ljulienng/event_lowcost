module EventsHelper

	def end_date
    @event = Event.find(params[:id])
    k = ((@event.duration / 60)+0.5).to_i
    end_daate = @event.start_date + k.hour
    return end_daate
  end

end
