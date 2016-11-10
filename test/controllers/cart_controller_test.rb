require 'test_helper'

class CartControllerTest < ActionController::TestCase
  test "should get view_cart" do
    get :view_cart
    assert_response :success
  end

  test "should get checkout" do
    get :checkout
    assert_response :success
  end

end
