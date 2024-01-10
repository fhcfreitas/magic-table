require "test_helper"

class RentalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get rentals_new_url
    assert_response :success
  end

  test "should get create" do
    get rentals_create_url
    assert_response :success
  end

  test "should get accept" do
    get rentals_accept_url
    assert_response :success
  end

  test "should get decline" do
    get rentals_decline_url
    assert_response :success
  end
end
