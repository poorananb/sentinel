class OrgsController < ApplicationController
  respond_to :json, :html
  
  def index
    @orgs = Org.all
    respond_with @orgs
  end

  def new
  end

  def create 
    respond_to do |format|
      if Org.create(org_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Organization was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @org.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def show
    respond_with Org.find(params[:id])
  end

  def edit
    respond_with Org.find(params[:id])
  end

  def update
    @org = Org.find(params[:id])
    respond_to do |format|
      if @org.update(org_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Organization was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @org.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @org = Org.find(params[:id])
    respond_to do |format|
      if @org.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Organization was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @org.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def org_params
    params.require(:org).permit(:name, :code) if params[:org]
  end
end