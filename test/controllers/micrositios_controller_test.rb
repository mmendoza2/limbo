require 'test_helper'

class MicrositiosControllerTest < ActionController::TestCase
  setup do
    @micrositio = micrositios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:micrositios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create micrositio" do
    assert_difference('Micrositio.count') do
      post :create, micrositio: {  }
    end

    assert_redirected_to micrositio_path(assigns(:micrositio))
  end

  test "should show micrositio" do
    get :show, id: @micrositio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @micrositio
    assert_response :success
  end

  test "should update micrositio" do
    patch :update, id: @micrositio, micrositio: {  }
    assert_redirected_to micrositio_path(assigns(:micrositio))
  end

  test "should destroy micrositio" do
    assert_difference('Micrositio.count', -1) do
      delete :destroy, id: @micrositio
    end

    assert_redirected_to micrositios_path
  end
end
