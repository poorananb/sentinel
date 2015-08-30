class Praxi < ActiveRecord::Base
    validates :org_code, presence: true 
    validates :client_code, presence: true
    validates :realm_code, presence: true 
    validates :prosess_code, presence: true
    validates :stage_code, presence: true 
    validates :sequence, presence: true
    validates :sla, presence: true 
    validates :tolerance_percentage, presence: true
    #, length: { in: 3..10 }, uniqueness: { case_sensitive: false }
end
