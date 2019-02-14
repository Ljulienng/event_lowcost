class ChargesController < ApplicationController
	before_action :set_event
	after_action :create_attendance, only: [:create]


	def new
	end

	def create
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )



	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

	def create_attendance
    @event = Event.find(params[:event_id])
    Attendance.create!(user: current_user, event: @event, stripe_customer_id: @customer.id)
  end

	private

	def set_event
   @event = Event.find(params[:event_id])
  end
end
