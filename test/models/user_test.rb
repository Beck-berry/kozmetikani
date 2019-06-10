require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "is email valid" do
    user = User.new
    assert_match '^[0-9a-z\.-]+@([0-9a-z-]+\.)+[a-z]{2,4}$', user.email, "Email address is invalid."
  end

  test "is password valid" do
    user = User.new
    assert_match '[0-9a-zA-Z]+', user.password, "Password is invalid."
  end
end
