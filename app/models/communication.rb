class Communication < ActiveRecord::Base
     validates :org_code, presence: true 
     validates :client_code, presence: true
     validates :primary_email, presence: true
     validates :secondary_email, presence: true
     validates :primary_phone, presence: true
     validates :secondary_phone, presence: true
   
end
