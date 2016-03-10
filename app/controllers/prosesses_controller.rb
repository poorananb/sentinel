class ProsessesController < ApplicationController
  def index
    if(params[:sort])
      @prosesses = Prosess.order(params[:sort]).all
      @total_count = @prosesses.count(:all)
      @limit = params[:limit].to_i
      @limited_prosesses = @prosesses.paginate(:page => params[:offset], :per_page => @limit)
      @response = { :prosesses => @limited_prosesses, :count => @total_count }
    else
      @response = Prosess.all
    end
    respond_with @response
  end
 

  def new
  end

  def create 
    respond_to do |format|
      if Prosess.create(prosess_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Process was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @prosess.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def show
    respond_with Prosess.find(params[:id])
  end

  def edit
    respond_with Prosess.find(params[:id])
  end

  def update
    @prosess = Prosess.find(params[:id])
    respond_to do |format|
      if @prosess.update(prosess_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Process was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @prosess.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @prosess = Prosess.find(params[:id])
    respond_to do |format|
      if @prosess.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Process was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @prosess.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def prosess_params
    params.require(:prosess).permit(:name, :code) if params[:prosess]
  end
end
