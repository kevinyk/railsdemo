class LikesController < ApplicationController
	def create
		@like = Like.new(user_id: params[:user_id], secret_id: params[:secret_id])
		redirect_to 'sessions/new' unless current_user
		if @like.save
			redirect_to :back
		else
			flash[:errors] = @like.errors.full_messages
		end
	end
	def destroy
		Like.find_by(user_id: params[:user_id], secret_id: params[:secret_id]).destroy
		redirect_to :back
	end
end
