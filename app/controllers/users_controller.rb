class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show, :edit]

  def show
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    user_params = params.permit(:first_name,:last_name,:description)

    if @user.update(user_params)
      render :show
    else
      render :show
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def new
    @user = User.new  
  end

  private

    def correct_user 
      unless current_user.id.to_i == params[:id].to_i
        redirect_to root_path
      end
    end


    def set_user
      @user = User.find(current_user.id)
    end
end


