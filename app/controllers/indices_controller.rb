class IndicesController < ApplicationController
  def index
    if(params[:sort])
      @indices = Index.order(params[:sort]).all
      @total_count = @indices.count(:all)
      @limit = params[:limit].to_i
      @limited_indices = @indices.paginate(:page => params[:offset], :per_page => @limit)
      @response = { :indices => @limited_indices, :count => @total_count }
    else
      @response = Index.all
    end
    respond_with @response
  end

  def new
  end

  def create 
    respond_to do |format|
      indiceParams = indice_params;
      indiceParams[:jobkey] = indiceParams[:job_code].upcase + '-' + indiceParams[:realm_code].upcase

      indiceParams[:cron] = Index.buildCron(params)
      @indice = Index.find_by_jobkey(indiceParams[:jobkey])
      if(@indice)
        format.json do
            render :json => { 
               :status => :exists, 
               :message => 'Sorry! Indice already exists.'
            }.to_json
        end
      else
        if Index.create(indiceParams)
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
    respond_with Index.find(params[:id])
  end

  def edit
    respond_with Index.find(params[:id])
  end

  def update
    @indice = Index.find(params[:id])
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
    @indice = Index.find(params[:id])
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
    params.require(:index).permit(:job_code, :realm_code, :critical, :notify, :run_length, :success_step) if params[:index]
  end
end
