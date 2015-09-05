class PraxisController < ApplicationController
    respond_to :json, :html
  
  def index
    @praxis = Praxi.all
    respond_with @praxis
  end

  def new
  end

  def create 
    respond_to do |format|
      if Praxi.create(praxi_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Praxis was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @praxi.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def show
    respond_with Praxi.find(params[:id])
  end

  def edit
    respond_with Praxi.find(params[:id])
  end

  def update
    @praxi = Praxi.find(params[:id])
    respond_to do |format|
      if @praxi.update(org_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Praxi was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @praxi.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @praxi = Praxi.find(params[:id])
    respond_to do |format|
      if @praxi.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Praxi was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @praxi.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def praxi_params
    params.require(:praxi).permit(:org_code, :client_code, :realm_code, :prosess_code, :stage_code, :sequence, :sla, :tolerance_percentage, :critical) if params[:praxy]
  end
end
