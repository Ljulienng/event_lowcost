class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  before_action :set_event, only: [:show]
  before_action :correct_organizer, only: [:edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.image.attach(params[:image])
    @event.admin = current_user

    respond_to do |format|
      if @event.save && @event.image.attached?
        format.html { redirect_to event_path(@event.id), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
          if @event.image.attached?
            flash[:danger] = "No image"
          end
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        if (params[:images]) != nil
          @event.image.attach(params[:image])
        end

        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
    end

    def correct_organizer
      @user = User.find(current_user.id)
      @event = Event.find(params[:id])
      redirect_to(root_url) unless current_user.id == @event.admin.id
    end
end
