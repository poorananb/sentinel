class SettingsController < ApplicationController
  before_filter :authenticate_user
  respond_to :json, :html
  
  def index
    @response = {}
    @settings = Setting.all
    
    @settings.each do |row|
      @response[row.key] = row.value
    end
    
    respond_with @response.to_json
  end
  
  def create
    @saved = Setting.saveSettings(params)
    respond_to do |format|
      if @saved
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Settings was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @saved, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  def update
    
  end
end