class OrgsController < ApplicationController
  before_action :set_org, only: [:show, :edit, :update, :destroy]

  def index
    @orgs = Org.search(params)
    render json: @orgs
  end

  def new
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
  end

  def edit
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


# class OrgsController < ApplicationController
#   before_filter :authenticate_user
#   respond_to :json, :html
#
#   def index
#     if(params[:sort])
#       Rails.logger.debug("My password: #{params}")
#       @orgs = Org.order(params[:sort]).all
#       @total_count = @orgs.count(:all)
#       @limit = (params[:limit]).to_i
#       if(@limit && @limit>0)
#         Rails.logger.debug("My password: #{params[:limit] + 'fffff'}")
#         @limit = @limit
#       else
#         @limit = Setting.fetchAttribute('limitofrows')
#         Rails.logger.debug("My password: #{@limit + 'gggggggg'}")
#       end
#       @limit = @limit.to_i
#       @limited_orgs = @orgs.paginate(:page => params[:offset], :per_page => @limit)
#
#       @totalPages = (@total_count/@limit).to_i
#       @response = { :orgs => @limited_orgs, :count => @total_count, :totalPages => @totalPages, :limit =>@limit }
#     else
#       @response = Org.all
#     end
#     respond_with @response
#   end
#
#   def new
#   end
#
#   def create
#     respond_to do |format|
#       if Org.create(org_params)
#         format.json do
#           render :json => {
#              :status => :ok,
#              :message => "Organization was successfully updated.!"
#           }.to_json
#         end
#       else
#         format.json do
#           render :json => {
#             :message => @org.errors,
#             :status => :error #unprocessable_entity
#           }.to_json
#         end
#       end
#     end
#   end
#
#   def show
#     respond_with Org.find(params[:id])
#   end
#
#   def edit
#     respond_with Org.find(params[:id])
#   end
#
#   def update
#     @org = Org.find(params[:id])
#     respond_to do |format|
#       if @org.update(org_params)
#         format.json do
#           render :json => {
#              :status => :ok,
#              :message => "Organization was successfully updated.!"
#           }.to_json
#         end
#       else
#         format.json do
#           render :json => {
#             :message => @org.errors,
#             :status => :error #unprocessable_entity
#           }.to_json
#         end
#       end
#     end
#   end
#
#   def destroy
#     @org = Org.find(params[:id])
#     respond_to do |format|
#       if @org.destroy
#         format.json do
#           render :json => {
#              :status => :ok,
#              :message => "Organization was successfully deleted.!"
#           }.to_json
#         end
#       else
#         format.json do
#           render :json => {
#             :message => @org.errors,
#             :status => :error #unprocessable_entity
#           }.to_json
#         end
#       end
#     end
#   end
#
#   private
#   def org_params
#     params.require(:org).permit(:name, :code) if params[:org]
#   end
# end
