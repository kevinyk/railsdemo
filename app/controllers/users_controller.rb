class UsersController < ApplicationController
	def new
	end
	def show
		@user = User.find(params[:id])
		@secrets = Secret.where(user_id: params[:id])
	end
	def create
		@user = User.new(name: params[:Name], email: params[:Email], password: params[:Password], password_confirmation: params[:Password_Confirmation])
		if @user.save
			@user_id = @user.id
			redirect_to "/users/#{@user_id}"
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to :back
		end

	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		@user.update(name: params[:Name], email: params[:Email])
		flash[:errors] = @user.errors.full_messages
		redirect_to "/users/#{@user.id}"
	end
	def destroy
		User.find(params[:id]).destroy
		redirect_to '/sessions/new'
	end
end
