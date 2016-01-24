class PraxiSerializer < ActiveModel::Serializer
  attributes :id, :code, :org_code, :client_code, :milestone_key, :realm_code, :prosess_code,
             :stage_code, :sequence, :sla, :tolerance_percentage, :critical
end
