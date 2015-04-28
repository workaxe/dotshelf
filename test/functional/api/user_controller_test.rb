require 'test_helper'

class Api::UserControllerTest < ActionController::TestCase
  test "should get sign_in" do
    get :sign_in
    assert_response :success
  end

  test "should get sign_out" do
    get :sign_out
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
