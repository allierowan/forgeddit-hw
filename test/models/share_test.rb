require 'test_helper'

class ShareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   test "net_votes give the sum of votes values" do
    assert_equal 0, shares(:two).net_votes
   end
end
