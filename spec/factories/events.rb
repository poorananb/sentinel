FactoryGirl.define do
  factory :event do
    praxis_code 'ABC'
    event_id 'EVENT_ID'
    client_code 'CLIENT_CODE'
    milestone_key 'CLIENT_CODE'
    realm_code 'CLIENT_CODE'
    prosess_code 'CLIENT_CODE'
    stage_code 'CLIENT_CODE'
    add_attribute :sequence, (1..5).to_a.sample
    occurred_at { Time.now }
  end
end