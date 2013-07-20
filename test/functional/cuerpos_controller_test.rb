require 'test_helper'

class CuerposControllerTest < ActionController::TestCase
  setup do
    @cuerpo = cuerpos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuerpos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cuerpo" do
    assert_difference('Cuerpo.count') do
      post :create, cuerpo: { descripcion: @cuerpo.descripcion, fecha_actualizacion: @cuerpo.fecha_actualizacion, fecha_creacion: @cuerpo.fecha_creacion, imagen_url: @cuerpo.imagen_url }
    end

    assert_redirected_to cuerpo_path(assigns(:cuerpo))
  end

  test "should show cuerpo" do
    get :show, id: @cuerpo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cuerpo
    assert_response :success
  end

  test "should update cuerpo" do
    put :update, id: @cuerpo, cuerpo: { descripcion: @cuerpo.descripcion, fecha_actualizacion: @cuerpo.fecha_actualizacion, fecha_creacion: @cuerpo.fecha_creacion, imagen_url: @cuerpo.imagen_url }
    assert_redirected_to cuerpo_path(assigns(:cuerpo))
  end

  test "should destroy cuerpo" do
    assert_difference('Cuerpo.count', -1) do
      delete :destroy, id: @cuerpo
    end

    assert_redirected_to cuerpos_path
  end
end
