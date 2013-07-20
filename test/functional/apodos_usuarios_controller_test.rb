require 'test_helper'

class ApodosUsuariosControllerTest < ActionController::TestCase
  setup do
    @apodos_usuario = apodos_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apodos_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apodos_usuario" do
    assert_difference('ApodosUsuario.count') do
      post :create, apodos_usuario: { apodo_id: @apodos_usuario.apodo_id, fecha_actualizacion: @apodos_usuario.fecha_actualizacion, fecha_creacion: @apodos_usuario.fecha_creacion, status: @apodos_usuario.status, usuario_desde_id: @apodos_usuario.usuario_desde_id, usuario_para_id: @apodos_usuario.usuario_para_id, visible: @apodos_usuario.visible }
    end

    assert_redirected_to apodos_usuario_path(assigns(:apodos_usuario))
  end

  test "should show apodos_usuario" do
    get :show, id: @apodos_usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apodos_usuario
    assert_response :success
  end

  test "should update apodos_usuario" do
    put :update, id: @apodos_usuario, apodos_usuario: { apodo_id: @apodos_usuario.apodo_id, fecha_actualizacion: @apodos_usuario.fecha_actualizacion, fecha_creacion: @apodos_usuario.fecha_creacion, status: @apodos_usuario.status, usuario_desde_id: @apodos_usuario.usuario_desde_id, usuario_para_id: @apodos_usuario.usuario_para_id, visible: @apodos_usuario.visible }
    assert_redirected_to apodos_usuario_path(assigns(:apodos_usuario))
  end

  test "should destroy apodos_usuario" do
    assert_difference('ApodosUsuario.count', -1) do
      delete :destroy, id: @apodos_usuario
    end

    assert_redirected_to apodos_usuarios_path
  end
end
