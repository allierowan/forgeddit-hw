require 'test_helper'

class SharesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_share_path
    assert_response :success
  end

  test "should get index" do
    get shares_path
    assert_response :success
    assert_match(/Greatest/, response.body)
  end

  test "should get create form" do
    get new_share_path
    assert_response :success
    assert_match(/Share Something/, response.body)
  end

  test "can create a share as current user" do
    post session_path, params: {email: 'arowan@wesleyan.edu', password: 'password'}
    post shares_path params: { share: { title: "This thing is cool", url: "http://facebook.com" } }
    assert_equal "This thing is cool", Share.last.title
    assert_equal "Allie", Share.last.user.first_name
  end

  test "should get edit form" do
    get edit_share_path
    assert_response :success
    assert_match(/Edit share/, response.body)
  end

end
