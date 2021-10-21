require "test_helper"

class ParkingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parking_index_url
    assert_response :success
  end

  test "should get new" do
    get parking_new_url
    assert_response :success
  end

  test "should get show" do
    get parking_show_url
    assert_response :success
  end

  test "should get edit" do
    get parking_edit_url
    assert_response :success
  end
end
