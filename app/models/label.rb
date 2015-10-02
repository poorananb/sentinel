class Label < ActiveRecord::Base
    validates :org_code, presence: true 
    validates :client_code, presence: true
    validates :key, presence: true 
    validates :label_name, presence: true
    validates :realm_code, presence: true
    validates :icon, presence: true
end
