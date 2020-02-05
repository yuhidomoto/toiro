class Users::UsersController < ApplicationController

	def show
		@user = User.find (params[:id])
	end

	def index
		@users = User.all
	end

	def edit
		@user = User.find (params[:id])
		if @user != current_user
			redirect_to root_path
		end
	end

	def update
		@user = User.find (params[:id])
		if @user.update (user_params)
			redirect_to users_user_path(@user.id)
		end
	end



private
	def user_params
		params.require(:user).permit(:name,:user_image,:introduction)
	end


end