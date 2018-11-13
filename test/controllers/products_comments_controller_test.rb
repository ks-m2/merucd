require 'test_helper'

class ProductsCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get products_comments_create_url
    assert_response :success
  end

  test "should get edit" do
    get products_comments_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get products_comments_destroy_url
    assert_response :success
  end

end
