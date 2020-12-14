require 'test_helper'

class TrademarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trademarks_index_url
    assert_response :success
  end

  test "should get create" do
    get trademarks_create_url
    assert_response :success
  end

  test "should get update" do
    get trademarks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get trademarks_destroy_url
    assert_response :success
  end

end
