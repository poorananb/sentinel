class UsersController < ApplicationController
  after_action :verify_authorized

  def index
	  @users = User.order(params[:sort]).all
	  authorize User
    @total_count = @users.count(:all)
    @limit = params[:limit].to_i
    @limited_orgs = @users.paginate(:page => params[:offset], :per_page => @limit)
    
    @response = { :users => @limited_orgs, :count => @total_count }
    respond_with @response
  end
  
  def new 
	  @user = User.new 
  end
  
  def show
    respond_with User.find(params[:id])
  end
  
  def edit
    authorize User
    respond_with User.find(params[:id])
  end
  
  def create 
  	@user = User.new(user_params) 
  	authorise(@user)
  	@user.password = params[:password]
  	respond_to do |format|
      if @user.save
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "User was created successfully!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @user.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  def update
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(@user, params[:current_password])
    	respond_to do |format|
    	  @user.password = params[:password]
        if @user.update(user_params)
          format.json do
            render :json => { 
               :status => :ok, 
               :message => "Profile was updated successfully!"
            }.to_json
          end  
        else
          format.json do 
            render :json => {
              :message => @user.errors, 
              :status => :error #unprocessable_entity 
            }.to_json
          end
        end
      end
    else
      respond_to do |format|
        format.json do 
          render :json => {
            :message => "Sorry! Please check your credentails and try again.", 
            :status => :wrpass, #unprocessable_entity 
            :data => User.find(params[:id])
          }.to_json
        end
      end
    end
  end
  
  private
    def user_params
        params.require(:user).permit(:name, :email, :password, :role)
    end
end
