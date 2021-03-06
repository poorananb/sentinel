class JobsController < ApplicationController
  def index
    if(params[:sort])
      @jobs = Job.order(params[:sort]).all
      @total_count = @jobs.count(:all)
      @limit = params[:limit].to_i
      @limited_jobs = @jobs.paginate(:page => params[:offset], :per_page => @limit)
      @response = { :jobs => @limited_jobs, :count => @total_count }
    else
      @response = Job.all
    end
    respond_with @response
  end

  def new
  end
  
  def create 
    respond_to do |format|
      jobParams = job_params;
      @job = Job.isJobCodeExists(jobParams)
      if(!@job.blank?)
        format.json do
            render :json => { 
               :status => :exists, 
               :message => 'Sorry! Job already exists.'
            }.to_json
        end
      else
        if Job.create(jobParams)
          format.json do
            render :json => { 
               :status => :ok, 
               :message => 'Job has been added successfully.'
            }.to_json
          end  
        else
          format.json do 
            render :json => {
              :message => @job.errors, 
              :status => :error #unprocessable_entity 
            }.to_json
          end
        end
      end
    end
  end

  def show
    respond_with Job.find(params[:id])
  end

  def edit
    respond_with Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    respond_to do |format|
      if @job.update(job_params)
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Job was successfully updated.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @job.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end

  def destroy
    @job = Job.find(params[:id])
    respond_to do |format|
      if @job.destroy
        format.json do
          render :json => { 
             :status => :ok, 
             :message => "Job was successfully deleted.!"
          }.to_json
        end  
      else
        format.json do 
          render :json => {
            :message => @job.errors, 
            :status => :error #unprocessable_entity 
          }.to_json
        end
      end 
    end
  end
  
  private
  def job_params
    params.require(:job).permit(:job_code, :org_code, :client_code, :name, :description) if params[:job]
  end
end
