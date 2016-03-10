class CommunicationSerializer < ActiveModel::Serializer
  attributes :id, :org_code, :client_code, :primary_email, :secondary_email, :primary_phone, :secondary_phone
end
