class ClientsController < ApplicationController
  before_filter :authenticate_user
  respond_to :json, :html
  
  def index
     if(params[:sort])
      @clients = Client.order(params[:sort]).all
      @total_count = @clients.count(:all)
      @limit = params[:limit].to_i
      @limited_clients = @clients.paginate(:page => params[:offset], :per_page => @limit)
      @response = { :clients => @limited_clients, :count => @total_count }
    else
      @response = Client.all
    end
    respond_with @response
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
    params.require(:client).permit(:name, :code,:org_code) if params[:client]
  end
end
