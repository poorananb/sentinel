class IndexSerializer < ActiveModel::Serializer
  attributes :id, :job_code, :realm_code, :cron, :critical, :notify, :jobkey, :run_length, :success_step
end
