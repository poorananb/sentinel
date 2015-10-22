class CommunicationsController < ApplicationController
  before_filter :authenticate_user
  respond_to :json, :html
  
  def index
    if(params[:sort])
      Rails.logger.debug("my passw: #{params}")
      @communications = Communication.order(params[:sort]).all
      @total_count = @communications.count(:all)
      @limit = params[:limit].to_i
      @limited_communications = @communications.paginate(:page => params[:offset], :per_page => @limit)
      @response = { :communications =>@limited_communications, :count => @total_count }
    else
      @response = Communication.all
    end
    respond_with @response
  end


  def new
  end

  def create 
    respond_to do |format|
      if Communication.create(communication_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Communication was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @communication.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def show
    respond_with Communication.find(params[:id])
  end

  def edit
    respond_with Communication.find(params[:id])
  end

  def update
    @communication = Communication.find(params[:id])
    respond_to do |format|
      if @communication.update(communication_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "communication was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @communication.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @communication = Communication.find(params[:id])
    respond_to do |format|
      if @communication.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "communication was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @communication.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def communication_params
    params.require(:communication).permit(:org_code, :client_code, :primary_email, :secondary_email, :primary_phone, :secondary_phone) if params[:communication]
  end
end
