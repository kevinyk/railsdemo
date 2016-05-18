class SecretsController < ApplicationController
	def index
		@users = User.all
		@secrets = Secret.all
		@likes = Like.all
	end
	def new
	end
	def create
		@user = User.find(params[:user_id])
		@secret = Secret.new(user_id: params[:user_id], content: params[:New_Secret])
		if @secret.save
			redirect_to "/users/#{params[:user_id]}"
		else
			flash[:errors] = @secret.errors.full_messages
			redirect_to 'back'
		end
	end
	def destroy
		Secret.find(params[:secret_id]).destroy
		redirect_to "/users/#{params[:user_id]}"
	end
end
