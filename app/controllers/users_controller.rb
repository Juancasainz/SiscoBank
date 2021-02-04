class UsersController < ApplicationController

 	def index
		@user = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if(@user.update(user_params))
			redirect_to @user
		else
			render 'edit'
		end
	end
		
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	def create
		#render plain: params[:user].inspect
		@user = User.new(user_params)
		if(@user.save)
			redirect_to @user
		else
			render 'new'
		end
	end
	
	private def	user_params
		params.require(:user)
			.permit(:nombre,:tipo,:ids,:tlf1,:tlf2,:correo,:vencimiento,:emision)
	end

end
