class StagesController < ApplicationController
  def index
    if(params[:sort])
      @stages = Stage.order(params[:sort]).all
      @total_count = @stages.count(:all)
      @limit = params[:limit].to_i
      @limited_stages = @stages.paginate(:page => params[:offset], :per_page => @limit)
      @response = { :stages => @limited_stages, :count => @total_count }
    else
      @response = Stage.all
    end
    respond_with @response
  end
  # def index
  #   @stages = Stage.all
  #   respond_with @stages
  # end

  def new
  end
  
  def create
    respond_to do |format|
      if Stage.create(stage_params)
        format.json do
          render :json => {
            :status => :ok,
            :message => 'Stage was created Successfully!'
          }.to_json
        end      
      else    
        format.json do
          render :json => {
            :status => :error,
            :message => @stage.errors
          }.to_json
        end  
      end
    end  
  end
  
  def show
    respond_with Stage.find(params[:id])
  end
  
  def edit
    respond_with Stage.find(params[:id])
  end
  
  def update
    @stage = Stage.find(params[:id])
    respond_to do |format|
      if @stage.update(stge_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Stage was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @stage.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @stage = Stage.find(params[:id])
    respond_to do |format|
      if @stage.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Stage was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @stage.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  
  private
  def stage_params
    params.require(:stage).permit(:name, :code) if params[:stage]
  end
end
