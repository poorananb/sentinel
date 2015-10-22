class LabelsController < ApplicationController
  before_filter :authenticate_user

  respond_to :json, :html
  
    def index
     if(params[:sort])
      @labels = Label.order(params[:sort]).all
      @total_count = @labels.count(:all)
      @limit = params[:limit].to_i
      @limited_labels = @labels.paginate(:page => params[:offset], :per_page => @limit)
      @response = { :labels => @limited_labels, :count => @total_count }
    else
      @response = Label.all
    end
    respond_with @response
  end

  def new
  end

  def create 
    respond_to do |format|
     Rails.logger.debug("My password: #{label_params}")
      if Label.create(label_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Label was successfully Created.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @label.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def show
    respond_with Label.find(params[:id])
  end

  def edit
    respond_with Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])
    respond_to do |format|
      if @label.update(label_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Label was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @label.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @label = Label.find(params[:id])
    respond_to do |format|
      if @label.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Label was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @label.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def label_params
    params.require(:label).permit(:org_code, :client_code, :key, :label_name,:realm_code,:icon) if params[:label]
  end
end
