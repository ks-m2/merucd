require 'test_helper'

class CartsProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get carts_products_create_url
    assert_response :success
  end

  test "should get update" do
    get carts_products_update_url
    assert_response :success
  end

  test "should get destroy" do
    get carts_products_destroy_url
    assert_response :success
  end

end
