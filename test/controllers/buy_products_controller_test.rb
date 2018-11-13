require 'test_helper'

class BuyProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get buy_products_create_url
    assert_response :success
  end

  test "should get destroy" do
    get buy_products_destroy_url
    assert_response :success
  end

end
