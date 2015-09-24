class SessionsController < ApplicationController 
  layout 'login'
  def index
  end
  
  def new
  end

  def create
    @user = User.where(email: params[:email]).first
    respond_to do |format|
      if @user && @user.authenticate(@user, params[:password])
        session[:user_id] = @user.id
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
    session[:user_id] = nil
    respond_to do |format|
      format.json do
        render :json => { 
           :status => :ok, 
           :message => "User logged out successfully!"
        }.to_json
      end
    end
  end
end
