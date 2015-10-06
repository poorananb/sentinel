class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
    
    @current_user = current_user
    @user = user
  end
  
  def create?
    user.admin? or not user.published?
  end
end