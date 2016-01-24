class JobSerializer < ActiveModel::Serializer
  attributes :id, :org_code, :job_code, :client_code, :name, :description
end