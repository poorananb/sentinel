class Event < ActiveRecord::Base
  validates :praxis_code, presence: true
  validates :event_id, presence: true
  validates :occurred_at, presence: true
  validates :client_code, presence: true
  validates :milestone_key, presence: true
  validates :realm_code, presence: true
  validates :prosess_code, presence: true
  validates :stage_code, presence: true
  validates :sequence, presence: true
end
