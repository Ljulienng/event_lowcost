class Admins::AdminController < ApplicationController
	before_action :check_if_admin

	def index
		@users = User.all
	end

	private

	def check_if_admin
		redirect_to root_path unless current_user.try(:admin?)
	end
end