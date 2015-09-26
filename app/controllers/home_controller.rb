class HomeController < ApplicationController
  before_filter :authorize
	
  def index
	render 'layouts/application'
  end
end
