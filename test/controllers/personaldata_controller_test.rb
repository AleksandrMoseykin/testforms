require 'test_helper'

class PersonaldataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get personaldata_index_url
    assert_response :success
  end

end
