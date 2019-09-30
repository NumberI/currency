require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_new_url
    assert_response :success
  end

  test "should get update" do
    get admin_update_url
    assert_response :success
  end

end
