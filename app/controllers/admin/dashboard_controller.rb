class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_filter :authorize
  
  def index
  end
end
