class ChargesController < ApplicationController

	def new
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

    Attendance.create(participant: current_user, event: Event.find(params[:event_id]), stripe_customer_id: params[:stripeToken])

    redirect_to event_path(params[:event_id])

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_event_attendance_path(params[:event_id])
  end
end
