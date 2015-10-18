class Milestone < ActiveRecord::Base
    validates :org_code, presence: true 
    validates :client_code, presence: true
    validates :key, presence: true
    validates :realm_code, presence: true
    
end
