class Event < ActiveRecord::Base
  validates :praxis_code, presence: true
  validates :event_id, presence: true
  validates :occurred_at, presence: true
end
