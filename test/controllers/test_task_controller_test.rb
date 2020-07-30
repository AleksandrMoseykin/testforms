require 'test_helper'

class TestTaskControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get test_task_index_url
    assert_response :success
  end

end
