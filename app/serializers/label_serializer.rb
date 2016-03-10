class LabelSerializer < ActiveModel::Serializer
  attributes :id, :org_code, :client_code, :realm_code, :key, :name, :icon
end
