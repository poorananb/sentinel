class RealmsController < ApplicationController
  before_filter :authenticate_user
  respond_to :json, :html
  
  #after_filter :verify_authorized
  
  def index
    realm = Realm. new
    authorise(realm)
    @realms = Realm.all
    respond_with @realms
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

