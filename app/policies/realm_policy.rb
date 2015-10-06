class RealmPolicy < ApplicationPolicy
  attr_reader :user, :realm

  def initialize(current_user, relam)
    raise Pundit::NotAuthorizedError, "must be logged in" unless current_user
    
    @current_user = current_user
    @realm = realm
  end
  
  def index?
    #before(:each) { user.roles << create(:role, activities: %w(person:show)) }
    #user.admin? or not realm.published?
  end
  
  def create?
    user.admin? or not realm.published?
  end
end