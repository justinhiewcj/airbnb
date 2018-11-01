require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get listings_name:string_url
    assert_response :success
  end

  test "should get description:text" do
    get listings_description:text_url
    assert_response :success
  end

  test "should get property_type:string" do
    get listings_property_type:string_url
    assert_response :success
  end

  test "should get room_type:strong" do
    get listings_room_type:strong_url
    assert_response :success
  end

  test "should get capacity:integer" do
    get listings_capacity:integer_url
    assert_response :success
  end

  test "should get price:integer" do
    get listings_price:integer_url
    assert_response :success
  end

  test "should get min_stay:integer" do
    get listings_min_stay:integer_url
    assert_response :success
  end

  test "should get address:string" do
    get listings_address:string_url
    assert_response :success
  end

end
