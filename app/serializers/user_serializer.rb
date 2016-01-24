class UserSerializer < ActiveModel::Serializer
  attributes :id, :role_id, :role_name, :name, :email

  def role_name
    self.role.try(:name)
  end
end
