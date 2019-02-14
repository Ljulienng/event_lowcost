class AttendancesController < ApplicationController
	before_action :authenticate_user!, only: [:new,:create,:index]
	before_action :correct_admin, only: [:index]

	def index
		@attendances = Event.find(params[:event_id]).attendances
	end

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @price = params[:price]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @price,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )

    Attendance.create(user: current_user, event: Event.find(params[:event_id]), stripe_customer_id: params[:stripeToken])

    redirect_to event_path(params[:event_id])

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_event_attendance_path(params[:event_id])
  end

  private

  def already_attendee
  	@user = User.find(current_user.id)
  end

  def correct_admin
  	@event = Event.find(params[:event_id])
  	redirect_to event_path(params[:event_id]) unless current_user.id == @event.admin.id
  end
end
