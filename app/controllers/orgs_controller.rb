class OrgsController < ApplicationController
  before_action :set_org, only: [:show, :edit, :update, :destroy]

  def index
    @orgs = Org.search(params)
    render json: @orgs
  end

  def create
    @org = Org.new(org_params)

    result =
        if @org.save
          {message: 'Organization was successfully created!', status: :ok}
        else
          {message: @org.errors, status: :error}
        end

    render json: result.to_json
  end

  def show
    render json: @org
  end

  def edit
    render json: @org
  end

  def update
    result =
        if @org.update(org_params)
          {message: 'Organization was successfully updated!', status: :ok}
        else
          {message: @org.errors, status: :error}
        end

    render json: result.to_json
  end

  def destroy
    result =
        if @org.destroy
          {message: 'Organization was successfully deleted!', status: :ok}
        else
          {message: @org.errors, status: :error}
        end

    render json: result.to_json
  end

  private

  def set_org
    @org = Org.find(params[:id])
  end

  def org_params
    params.require(:org).permit(:name, :code)
  end
end