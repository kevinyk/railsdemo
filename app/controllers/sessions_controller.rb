class SessionsController < ApplicationController
  def new
  	
  end
  def create
  	@user = User.find_by(email: params[:Email])
  	if @user.authenticate(params[:Password])
  		session[:user_id] = @user.id
  		redirect_to "/users/#{@user.id}"
  	else
  		flash[:errors] = ["Invalid email or password"]
  		redirect_to :back
  	end
  end
  def destroy
  	session[:user_id] = nil
  	redirect_to '/sessions/new'
  end
end
