require 'test_helper'

class ZooplaControllerTest < ActionDispatch::IntegrationTest
  test "should get search_properties" do
    get zoopla_search_properties_url
    assert_response :success
  end

  test "should get user_properties" do
    get zoopla_user_properties_url
    assert_response :success
  end

end
