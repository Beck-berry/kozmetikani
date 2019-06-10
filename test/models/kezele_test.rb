require 'test_helper'

class KezeleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "must have a name" do
    kezele = Kezele.new
    assert_not kezele.save, "Kezele does not have a name."
  end
end
