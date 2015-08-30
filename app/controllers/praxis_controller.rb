class PraxisController < ApplicationController
    respond_to :json, :html
  
  def index
    @praxys = Praxy.all
    respond_with @praxys
  end

  def new
  end

  def create 
    respond_to do |format|
      if Praxy.create(praxy_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Praxis was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @praxy.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def show
    respond_with Praxy.find(params[:id])
  end

  def edit
    respond_with Praxy.find(params[:id])
  end

  def update
    @praxy = Praxy.find(params[:id])
    respond_to do |format|
      if @praxy.update(org_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Praxy was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @praxy.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @praxy = Praxy.find(params[:id])
    respond_to do |format|
      if @praxy.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Praxy was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @praxy.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def praxy_params
    params.require(:praxy).permit(:org_code, :client_code, :realm_code, :prosess_code, :stage_code, :sequence, :sla, :tolerance_percentage, :critical) if params[:praxy]
  end
end
