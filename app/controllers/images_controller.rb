class ImagesController < ApplicationController
  def index
  end

  def create
    
    name = params[:file].original_filename
    only_name=   File.basename(name, ".*" )
    ext=File.extname(name)
    directory = Rails.root.join('app', 'assets', 'upload')
    countv=Dir[File.join(directory, '**', '*')].count
    nname=only_name + '-' +  countv.to_s + ext
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:file].read) }
    flash[:notice] = "File uploaded"
    render :json => { 
             :status => :ok, 
             :message => "file upload",
             :filename=>nname
          }.to_json
  end

  def show
  end
end
