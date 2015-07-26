class OrgsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Org.all
  end

  def new
  end

  def create
    respond_with Org.create(org_params)
  end

  def show
    respond_with Org.find(params[:id])
  end

  def edit
    respond_with Org.find(params[:id])
  end

  def update
    respond_to do |format|
      if org.update(org_params)
        format.html { redirect_to @player, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @org = Org.find(params[:id])
    respond_to do |format|
      if @org.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Organization was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @org.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def org_params
    params.require(:org).permit(:name, :code)
  end
end
