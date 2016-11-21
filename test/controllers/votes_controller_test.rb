require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  test "can create a vote on a share" do
    post session_path, params: {email: 'arowan@wesleyan.edu', password: 'password'}
    s_id = shares(:three).id
    post share_votes_path(share_id: s_id), params: { vote: { value: 0, user_id: users(:allie).id } }
    assert_equal 0, Vote.last.value
    assert_equal s_id, Vote.last.share_id
  end

  test "can update a vote on a share" do
    post session_path, params: {email: 'arowan@wesleyan.edu', password: 'password'}
    s_id = shares(:three).id
    v_id = votes(:two).id
    patch share_vote_path(share_id: s_id, id: v_id), params: { vote: { value: 1 } }
    assert_equal(1, Vote.find(v_id).value)
  end

end
