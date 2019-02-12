class UsersController < ApplicationController
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
end
