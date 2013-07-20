require 'test_helper'

class ApodosControllerTest < ActionController::TestCase
  setup do
    @apodo = apodos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apodos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apodo" do
    assert_difference('Apodo.count') do
      post :create, apodo: { autor_id: @apodo.autor_id, calificacion: @apodo.calificacion, descripcion: @apodo.descripcion, destacado: @apodo.destacado, fecha_actualizacion: @apodo.fecha_actualizacion, fecha_creacion: @apodo.fecha_creacion, imagen_url: @apodo.imagen_url, nombre: @apodo.nombre, prefijo: @apodo.prefijo, visible: @apodo.visible }
    end

    assert_redirected_to apodo_path(assigns(:apodo))
  end

  test "should show apodo" do
    get :show, id: @apodo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apodo
    assert_response :success
  end

  test "should update apodo" do
    put :update, id: @apodo, apodo: { autor_id: @apodo.autor_id, calificacion: @apodo.calificacion, descripcion: @apodo.descripcion, destacado: @apodo.destacado, fecha_actualizacion: @apodo.fecha_actualizacion, fecha_creacion: @apodo.fecha_creacion, imagen_url: @apodo.imagen_url, nombre: @apodo.nombre, prefijo: @apodo.prefijo, visible: @apodo.visible }
    assert_redirected_to apodo_path(assigns(:apodo))
  end

  test "should destroy apodo" do
    assert_difference('Apodo.count', -1) do
      delete :destroy, id: @apodo
    end

    assert_redirected_to apodos_path
  end
end
