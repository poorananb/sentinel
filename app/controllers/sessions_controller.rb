class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  layout 'login'
  def index
    @current_user ||= User.find_by(id: session[:user_id])
    
    if(@current_user)
      redirect_to '/home#index'
    end
  end
  
  def new
  end

  def create
    @user = User.where(email: params[:email]).first
    respond_to do |format|
      if @user && @user.authenticate(@user, params[:password])
        log_in @user
        params[:remember_me] == true ? remember(@user) : forget(@user)

        format.json do
          render :json => { 
             :status => :ok, 
             :message => "User logged in successfully!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => "Please check email/password and try again.", 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    log_out
    redirect_to '/login'
  end
end
