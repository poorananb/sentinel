require 'test_helper'

class OrgTest < ActiveSupport::TestCase
  
  def setup
    @org = Org.new(name: "Example", code: "code")
  end
  
  test "should be valid" do
    assert @org.valid?
  end
  
  test "name should be present" do
    @org.name = ""
    assert_not @org.valid?
  end
  
  test "code should be present" do
    @org.code = ""
    assert_not @org.valid?
  end
  
  test "code should not exceed length 10" do
    @org.code = "a" * 11
    assert_not @org.valid?
  end
  
  test "code should be unique" do
    duplicate_org = @org.dup
    duplicate_org.code = @org.code.upcase
    @org.save
    assert_not duplicate_org.valid?
  end
end
