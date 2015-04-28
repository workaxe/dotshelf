require 'test_helper'

class RegistrarsControllerTest < ActionController::TestCase
  setup do
    @registrar = registrars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registrars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registrar" do
    assert_difference('Registrar.count') do
      post :create, registrar: { extra: @registrar.extra, name: @registrar.name, url_param: @registrar.url_param }
    end

    assert_redirected_to registrar_path(assigns(:registrar))
  end

  test "should show registrar" do
    get :show, id: @registrar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registrar
    assert_response :success
  end

  test "should update registrar" do
    put :update, id: @registrar, registrar: { extra: @registrar.extra, name: @registrar.name, url_param: @registrar.url_param }
    assert_redirected_to registrar_path(assigns(:registrar))
  end

  test "should destroy registrar" do
    assert_difference('Registrar.count', -1) do
      delete :destroy, id: @registrar
    end

    assert_redirected_to registrars_path
  end
end
