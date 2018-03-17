require 'test_helper'

class CamilosControllerTest < ActionController::TestCase
  setup do
    @camilo = camilos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:camilos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camilo" do
    assert_difference('Camilo.count') do
      post :create, camilo: { age: @camilo.age, name: @camilo.name }
    end

    assert_redirected_to camilo_path(assigns(:camilo))
  end

  test "should show camilo" do
    get :show, id: @camilo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camilo
    assert_response :success
  end

  test "should update camilo" do
    patch :update, id: @camilo, camilo: { age: @camilo.age, name: @camilo.name }
    assert_redirected_to camilo_path(assigns(:camilo))
  end

  test "should destroy camilo" do
    assert_difference('Camilo.count', -1) do
      delete :destroy, id: @camilo
    end

    assert_redirected_to camilos_path
  end
end
