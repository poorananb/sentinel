class IndicesController < ApplicationController
  before_filter :authenticate_user
  respond_to :json, :html
  
  def index
    @indices = Indice.order(params[:sort]).all
    @total_count = @indices.count(:all)
    @limit = params[:limit].to_i
    @limited_indices = @indices.paginate(:page => params[:offset], :per_page => @limit)
    
    @response = { :indices => @limited_indices, :count => @total_count }
    respond_with @response
  end

  def new
  end

  def create 
    respond_to do |format|
      indiceParams = indice_params;
      indiceParams[:jobkey] = praxi_params[:job_code].upcase + '-' + praxi_params[:realm_code].upcase
      @indice = indice.find_by_jobkey(praxiParams[:jobkey])
      if(@indice)
        format.json do
            render :json => { 
               :status => :exists, 
               :message => 'Sorry! Indice already exists.'
            }.to_json
        end
      else
        if Indice.create(indiceParams)
          format.json do
            render :json => { 
               :status => :ok, 
               :message => 'Indice has been added successfully.'
            }.to_json
          end  
        else
          format.json do 
            render :json => {
              :message => @indice.errors, 
              :status => :error #unprocessable_entity 
            }.to_json
          end
        end
      end
    end
  end

  def show
    respond_with Indice.find(params[:id])
  end

  def edit
    respond_with Indice.find(params[:id])
  end

  def update
    @indice = Indice.find(params[:id])
    respond_to do |format|
      if @indice.update(indice_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Indice was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @indice.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @indice = Indice.find(params[:id])
    respond_to do |format|
      if @indice.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Indice was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @indice.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def indice_params
    params.require(:indice).permit(:job_code, :realm_code, :cron_min,:cron_hour,:cron_day,:cron_week,:cron_month, :critical, :notify, :run_legth, :success_step) if params[:indice]
  end
end
