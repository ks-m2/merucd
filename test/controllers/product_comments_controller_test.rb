require 'test_helper'

class ProductCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get product_comments_create_url
    assert_response :success
  end

  test "should get edit" do
    get product_comments_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get product_comments_destroy_url
    assert_response :success
  end

end
