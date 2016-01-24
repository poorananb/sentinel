class Client < ActiveRecord::Base
  extend Searchable
  belongs_to :org

  validates :name, presence: true
  validates :code, presence: true, length: { in: 3..10 }, uniqueness: { case_sensitive: false }
  validates :org_code, presence: true

  before_validation :set_org_code

  private

  def set_org_code
    self.org_code = self.org.code
  end
end
