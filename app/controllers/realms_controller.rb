class RealmsController < ApplicationController
   def index
    if(params[:sort])
      @realms = Realm.order(params[:sort]).all
      @total_count = @realms.count(:all)
      @limit = params[:limit].to_i
      @limited_realms = @realms.paginate(:page => params[:offset], :per_page => @limit)
      @response = { :realms => @limited_realms, :count => @total_count }
    else
      @response = Realm.all
    end
    respond_with @response
  end

  def new
  end

  def create 
    respond_to do |format|
      if Realm.create(realm_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Realm was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @realm.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def show
    respond_with Realm.find(params[:id])
  end

  def edit
    respond_with Realm.find(params[:id])
  end

  def update
    @realm = Realm.find(params[:id])
    respond_to do |format|
      if @realm.update(realm_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Realm was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @realm.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @realm = Realm.find(params[:id])
    respond_to do |format|
      if @realm.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "realm was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @realm.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def realm_params
    params.require(:realm).permit(:name, :code) if params[:realm]
  end
end

