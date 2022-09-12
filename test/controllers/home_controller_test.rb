require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get _header" do
    get home__header_url
    assert_response :success
  end
end
