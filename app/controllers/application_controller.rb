class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  include SessionsHelper
  include ApplicationHelper
  
  respond_to :json
  protect_from_forgery with: :exception
  
  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied
  
  # Enforces access right checks for individuals resources
  #after_filter :verify_authorized, :except => [:index, :sessions]

  # Enforces access right checks for collections
  #after_filter :verify_policy_scoped, :only => :index
  
  def authenticate_user
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
  
  helper_method :current_user
  
  private
    def permission_denied
      head 403
    end
end
