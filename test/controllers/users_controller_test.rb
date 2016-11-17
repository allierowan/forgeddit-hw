require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_path
    assert_response :success
    assert_match(/Create a login/, response.body)
  end

  test "can create new user" do
    post users_path params: { user: { first_name: "Allie", last_name: "Rowan", email: "arowan@wesleyan.edu", password: "password" } }
    assert_response :redirect
    assert_equal "Allie", User.last.first_name
  end

end
