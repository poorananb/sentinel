class RolesController < ApplicationController
  before_filter :authenticate_user
  respond_to :json, :html
  #after_filter :verify_authorized
  
  def index
    if params[:sort]
    	@roles = Role.order(params[:sort]).all
        @total_count = @roles.count(:all)
        @limit = params[:limit].to_i
        @limited_roles = @roles.paginate(:page => params[:offset], :per_page => @limit)
    else
        @roles = Role.all
        @total_count = @roles.count(:all)
    end
    @response = { :roles => @limited_roles, :count => @total_count }
    respond_with @response
  end
  
  def new 
	  @role = Role.new 
  end
  
  def show
    respond_with Role.find(params[:id])
  end
  
  def edit
    respond_with Role.find(params[:id])
  end
  
  def create 
  	@role = Role.new(role_params)
  	role_activities = self.checkValues
  	@role.activities = role_activities
  	#authorise(@user)
  	respond_to do |format|
      if @role.save
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Role was created successfully!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @role.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  def update 
    @role = Role.find(params[:id])
    role_activities = self.checkValues
  	@role.activities = role_activities
    respond_to do |format|
      if @role.update(role_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Role was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @role.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
   
  def checkValues
    acts = []
    if params[:activities_list].present?
        if params[:action] == "update"
            arr = params[:activities_list] #eval(params[:activities_list])
        else
            arr = params[:activities_list]
        end
        arr.each do |key, value| 
            acts << key  #associate that user with something else
        end
    end
    return acts
  end
  
  private
    def role_params
        params.require(:role).permit(:name, :activities_list => [])
    end
end
