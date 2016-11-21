require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_share_comment_path(shares(:one).id)
    assert_response :success
    assert_match(/Share Something/, response.body)
  end

  test "should get edit" do
    get edit_share_comment_path(shares(:two).id, comments(:one).id)
    assert_response :success
    assert_match(/Comment/, response.body)
  end

  test "should get index" do
    get share_comments_path(shares(:two).id)
    assert_response :success
    assert_match(/This is pretty cool/, response.body)
  end

  test "can delete comment" do
    comment_id = comments(:one).id
    delete share_comment_path(share_id: shares(:two).id, id: comment_id)
    refute Comment.find_by(id: comment_id)
  end

end
