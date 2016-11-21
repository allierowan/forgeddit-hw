require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  test "can only have -1 to 1 for value" do
    vote = Vote.new(value: 10, share: shares(:one), user: users(:allie))
    assert_raises do
      vote.save!
    end
  end

  test "can only have 1 vote per user per share" do
    Vote.create!(value: 1, share: shares(:one), user: users(:allie))
    vote2 = Vote.new(value: -1, share: shares(:one), user: users(:allie))
    assert_raises do
      vote2.save!
    end
  end

end
