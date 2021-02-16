require 'test_helper'

class StaticPagesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_pages_controller_index_url
    assert_response :success
  end

  test "should get secret" do
    get static_pages_controller_secret_url
    assert_response :success
  end

end
