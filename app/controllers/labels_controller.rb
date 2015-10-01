class LabelsController < ApplicationController
    respond_to :json, :html
  
  def index

    @response = Label.all
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
