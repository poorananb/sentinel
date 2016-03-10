class OrgSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :timezone, :locale
end
