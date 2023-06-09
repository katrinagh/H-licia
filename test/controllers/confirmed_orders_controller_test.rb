require "test_helper"

class ConfirmedOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get confirmed_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get confirmed_orders_show_url
    assert_response :success
  end

  test "should get new" do
    get confirmed_orders_new_url
    assert_response :success
  end
end
