require 'test_helper'

class AdminPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_pages_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_pages_show_url
    assert_response :success
  end

end
