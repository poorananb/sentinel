class Api::V1::EventsController < ApplicationController
  protect_from_forgery with: :null_session
    
  def index
    logger.debug 'Hit Events index'
    @events = Event.all
    respond_with @events
  end

  def new
  end
  
  def create
    
    respond_to do |format|
      if Event.create(event_myparams)
        logger.debug 'Loggit ' + event_myparams.inspect
        format.json do
          render :json => {
            :status => :ok,
            :message => 'Event was created Successfully!'
          }.to_json
        end      
      else    
        format.json do
          render :json => {
            :status => :error,
            :message => @event.errors
          }.to_json
        end  
      end
    end  
  end
  
  def show
    respond_with Event.find(params[:id])
  end
  
  def edit
    respond_with Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.update(event_myparams)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Event was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @event.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @event = Event.find(params[:id])
    respond_to do |format|
      if @event.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Event was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @event.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  
  private
  def event_myparams
   params.require(:event).permit(:praxis_code, :event_id, :occurred_at, :zipcode, :country) if params[:event]
  end
end
