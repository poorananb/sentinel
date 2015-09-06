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
      praxiParams = praxi_params;
      praxiParams[:praxis_code] = praxi_params[:org_code].upcase + '-' + praxi_params[:client_code].upcase + '-' + praxi_params[:realm_code].upcase + '-' + praxi_params[:prosess_code].upcase + '-' + praxi_params[:stage_code].upcase
      @praxi = Praxi.find_by_praxis_code(praxiParams[:praxis_code])
      if(@praxi)
        format.json do
            render :json => { 
               :status => :exists, 
               :message => 'Sorry! Praxi already exists.'
            }.to_json
        end
      else
        if Praxi.create(praxiParams)
          format.json do
            render :json => { 
               :status => :ok, 
               :message => 'Praxi has been added successfully.'
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
      if @praxi.update(praxi_params)
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
    params.require(:praxi).permit(:org_code, :client_code, :realm_code, :prosess_code, :stage_code, :sequence, :sla, :tolerance_percentage, :critical) if params[:praxi]
  end
end
