require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_path
    assert_response :success
    assert_match(/Create a login/, response.body)
  end

  test "can create new user" do
    post users_path params: { user: { first_name: "Allie", last_name: "Rowan", email: "arowan+1@wesleyan.edu", password: "password" } }
    assert_response :redirect
    assert_equal "Allie", User.last.first_name
  end

  test "can get edit form for users profile info" do
    post session_path, params: {email: 'arowan@wesleyan.edu', password: 'password'}
    get edit_user_path(session["current_user_id"])
    assert_match(/Edit your profile/, response.body)
  end

end
