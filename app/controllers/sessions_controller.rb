class SessionsController < ApplicationController
  layout 'admin'
  
  def index
  end
  
  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "index"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
