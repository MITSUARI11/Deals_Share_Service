require "test_helper"

class Admin::ManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_managements_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_managements_edit_url
    assert_response :success
  end
end
