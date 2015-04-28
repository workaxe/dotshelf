require 'test_helper'

class EndingsControllerTest < ActionController::TestCase
  setup do
    @ending = endings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:endings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ending" do
    assert_difference('Ending.count') do
      post :create, ending: { content: @ending.content, price: @ending.price, title: @ending.title }
    end

    assert_redirected_to ending_path(assigns(:ending))
  end

  test "should show ending" do
    get :show, id: @ending
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ending
    assert_response :success
  end

  test "should update ending" do
    put :update, id: @ending, ending: { content: @ending.content, price: @ending.price, title: @ending.title }
    assert_redirected_to ending_path(assigns(:ending))
  end

  test "should destroy ending" do
    assert_difference('Ending.count', -1) do
      delete :destroy, id: @ending
    end

    assert_redirected_to endings_path
  end
end
