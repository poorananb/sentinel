class WelcomeController < ApplicationController
  before_filter :authenticate_user
  
  # GET /welcome
  def index

  end

end
