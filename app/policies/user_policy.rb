class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end
  
  def index?
    @type = 'user:index'
    role = @current_user.role
    authorized(role, @type)
  end
  
  def edit?
    @type = 'user:edit'
    role = @current_user.role
    authorized(role, @type)
  end
  
  def create?
    @type = 'user:create'
    role = @current_user.role
    authorized(role, @type)
  end
  
  def update?
    @type = 'user:update'
    role = @current_user.role
    authorized(role, @type)
  end
end