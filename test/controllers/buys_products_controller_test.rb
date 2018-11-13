require 'test_helper'

class BuysProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get buys_products_create_url
    assert_response :success
  end

  test "should get destroy" do
    get buys_products_destroy_url
    assert_response :success
  end

end
