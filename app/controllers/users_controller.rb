class UsersController < ApplicationController
  before_filter :authorize
  respond_to :json, :html
  
  def index
	  @users = User.order(params[:sort]).all
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
    @user = User.find(params[:id])
  end
  
  def create 
  	@user = User.new(user_params) 
    #Rails.logger.debug("My password: #{@user}")
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
  
  private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
