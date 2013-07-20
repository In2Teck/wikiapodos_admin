require 'test_helper'

class CompartidosControllerTest < ActionController::TestCase
  setup do
    @compartido = compartidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compartidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compartido" do
    assert_difference('Compartido.count') do
      post :create, compartido: { apodo_id: @compartido.apodo_id, fecha_actualizacion: @compartido.fecha_actualizacion, fecha_creacion: @compartido.fecha_creacion, origen: @compartido.origen, usuario_id: @compartido.usuario_id }
    end

    assert_redirected_to compartido_path(assigns(:compartido))
  end

  test "should show compartido" do
    get :show, id: @compartido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compartido
    assert_response :success
  end

  test "should update compartido" do
    put :update, id: @compartido, compartido: { apodo_id: @compartido.apodo_id, fecha_actualizacion: @compartido.fecha_actualizacion, fecha_creacion: @compartido.fecha_creacion, origen: @compartido.origen, usuario_id: @compartido.usuario_id }
    assert_redirected_to compartido_path(assigns(:compartido))
  end

  test "should destroy compartido" do
    assert_difference('Compartido.count', -1) do
      delete :destroy, id: @compartido
    end

    assert_redirected_to compartidos_path
  end
end
