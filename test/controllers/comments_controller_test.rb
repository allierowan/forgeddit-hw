require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_share_comment_path(shares(:one).id)
    assert_response :success
    assert_match(/Add Comment/, response.body)
  end

  test "should get edit" do
    get edit_share_comment_path(shares(:two).id, comments(:one).id)
    assert_response :success
    assert_match(/Edit comment/, response.body)
  end

  test "should get index" do
    get share_comments_path(shares(:one).id)
    assert_response :success
    assert_match(/This is pretty cool/, response.body)
  end

end
