class Admins::UsersController < ApplicationController
	before_action :check_if_admin


	def index
		@users = User.all
	end

	def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user_params = params.permit(:first_name,:last_name,:description)

    if @user.update(user_params)
      redirect_to admins_users_path
      flash[:notice] = "The user was successfully modified"
    else
      render :show
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new  
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to admins_root_path
  end

 private

	def check_if_admin
		redirect_to root_path unless current_user.try(:admin?)
	end
	
end