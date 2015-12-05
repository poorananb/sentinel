class Realm < ActiveRecord::Base
    validates :name, presence: true 
    validates :code, presence: true, length: { in: 2..10 }, uniqueness: { case_sensitive: false }
end
