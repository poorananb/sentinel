class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end
  
  def user_activities
    @user.roles.select(:activities).distinct.map(&:activities).flatten
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
  
  def authorized(role, type)
    if role!=0 && role!=''
      @role = Role.find(role)
      if @role
        @activities = @role.activities
        @exists = @activities.include?(type)
        
        if @exists
          true
        else
          false
        end
      else
        false
      end
    else
      false
    end
  end
end
