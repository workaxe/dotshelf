require 'test_helper'

class PanelControllerTest < ActionController::TestCase
  test "should get customer" do
    get :customer
    assert_response :success
  end

  test "should get domain" do
    get :domain
    assert_response :success
  end

  test "should get reseller" do
    get :reseller
    assert_response :success
  end

  test "should get order" do
    get :order
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
