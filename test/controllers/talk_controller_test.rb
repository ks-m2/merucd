require 'test_helper'

class TalkControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get talk_create_url
    assert_response :success
  end

  test "should get destroy" do
    get talk_destroy_url
    assert_response :success
  end

end
