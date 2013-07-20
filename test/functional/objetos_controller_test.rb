require 'test_helper'

class ObjetosControllerTest < ActionController::TestCase
  setup do
    @objeto = objetos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:objetos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create objeto" do
    assert_difference('Objeto.count') do
      post :create, objeto: { categoria_id: @objeto.categoria_id, descripcion: @objeto.descripcion, fecha_actualizacion: @objeto.fecha_actualizacion, fecha_creacion: @objeto.fecha_creacion, imagen_url: @objeto.imagen_url }
    end

    assert_redirected_to objeto_path(assigns(:objeto))
  end

  test "should show objeto" do
    get :show, id: @objeto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @objeto
    assert_response :success
  end

  test "should update objeto" do
    put :update, id: @objeto, objeto: { categoria_id: @objeto.categoria_id, descripcion: @objeto.descripcion, fecha_actualizacion: @objeto.fecha_actualizacion, fecha_creacion: @objeto.fecha_creacion, imagen_url: @objeto.imagen_url }
    assert_redirected_to objeto_path(assigns(:objeto))
  end

  test "should destroy objeto" do
    assert_difference('Objeto.count', -1) do
      delete :destroy, id: @objeto
    end

    assert_redirected_to objetos_path
  end
end
