class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.search(params)
    render json: @clients
  end

  def create
    @client = Client.new(client_params)

    result =
        if @client.save
          {message: 'Client was successfully created!', status: :ok}
        else
          {message: @client.errors, status: :error}
        end

    render json: result.to_json
  end

  def show
    render json: @client
  end

  def edit
    render json: @client
  end

  def update
    result =
        if @client.update(client_params)
          {status: :ok, message: 'Client was successfully updated!'}
        else
          {status: :error, message: @client.errors}
        end

    render json: result.to_json
  end

  def destroy
    result =
        if @client.destroy
          {status: :ok, message: 'Client was successfully deleted!'}
        else
          {status: :ok, message: @client.errors}
        end

    render json: result.to_json
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end
  
  def client_params
    params.require(:client).permit(:name, :code, :org_id)
  end
end
