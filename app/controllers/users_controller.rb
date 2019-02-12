class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :destroy]

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

  private

    def correct_user 
      @user = User.find(params[:id])
      redirect_to(root_url) unless (current_user?(@user) || current_user.admin?)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def set_user
      @user = User.find(current_user.id)
    end




end


