require 'test_helper'

class ProfilevisitorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profilevisitor_index_url
    assert_response :success
  end

end
