FactoryGirl.define do
  factory :event do
    praxis_code 'ABC'
    event_id 'EVENT_ID'
    occurred_at { Time.now }
  end
end
