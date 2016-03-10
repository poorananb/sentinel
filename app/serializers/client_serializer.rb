class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :timezone, :locale, :org_code
end
