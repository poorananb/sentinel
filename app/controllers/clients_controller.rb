class ClientsController < ApplicationController
  before_filter :authorize
  respond_to :json, :html
  
  def index
    @clients = Client.all
    respond_with @clients
  end

  def new
  end

  def create 
    respond_to do |format|
      if Client.create(client_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Client was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @client.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def show
    respond_with Client.find(params[:id])
  end

  def edit
    respond_with Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    respond_to do |format|
      if @client.update(client_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Client was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @client.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @client = Client.find(params[:id])
    respond_to do |format|
      if @client.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Client was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @client.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def client_params
    params.require(:client).permit(:name, :code) if params[:client]
  end
end
