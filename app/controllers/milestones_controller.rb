class MilestonesController < ApplicationController
    before_filter :authenticate_user

  respond_to :json, :html
  
  def index

    @response = Milestone.all
    respond_with @response
  end

  def new
  end

  def create 
    respond_to do |format|
     Rails.logger.debug("My password: #{milestone_params}")
      if Milestone.create(milestone_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Milestone was successfully Created.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @milestone.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def show
    respond_with Milestone.find(params[:id])
  end

  def edit
    respond_with Milestone.find(params[:id])
  end

  def update
    @milestone = Milestone.find(params[:id])
    respond_to do |format|
      if @milestone.update(label_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Milestone was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @milestone.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @milestone = Milestone.find(params[:id])
    respond_to do |format|
      if @milestone.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "milestone was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @milestone.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def milestone_params
    params.require(:milestone).permit(:org_code, :client_code, :key,:realm_code) if params[:milestone]
  end
end
