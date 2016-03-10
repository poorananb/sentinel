class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  include SessionsHelper
  include ApplicationHelper
  
  respond_to :json
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  before_filter :render_layout_only, if: proc { request.format.html? }

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied
  
  # Enforces access right checks for individuals resources
  #after_filter :verify_authorized, :except => [:index, :sessions]

  # Enforces access right checks for collections
  #after_filter :verify_policy_scoped, :only => :index

  #private
  #def user_not_authorized
    #flash[:alert] = "You are not authorized to perform this action."
    #redirect_to(request.referrer || root_path)
  #end

  def authenticate_user!
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
  
  helper_method :current_user
  
  private

  def render_layout_only
    render text: '', layout: true
  end

  def permission_denied
    render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
  end
end
