class MilestoneSerializer < ActiveModel::Serializer
  attributes :id, :org_code, :client_code, :key, :realm_code
end
