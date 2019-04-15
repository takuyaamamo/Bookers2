require 'test_helper'

class ToppageControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get toppage_top_url
    assert_response :success
  end

end
