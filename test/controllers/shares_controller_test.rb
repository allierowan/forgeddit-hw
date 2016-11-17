require 'test_helper'

class SharesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shares_new_url
    assert_response :success
  end

  test "should get index" do
    get shares_index_url
    assert_response :success
  end

  test "should get edit" do
    get shares_edit_url
    assert_response :success
  end

end
