require 'test_helper'

class ImagenesControllerTest < ActionController::TestCase
  setup do
    @imagen = imagenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imagenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imagen" do
    assert_difference('Imagen.count') do
      post :create, imagen: { cuerpo_id: @imagen.cuerpo_id, fecha_actualizacion: @imagen.fecha_actualizacion, fecha_creacion: @imagen.fecha_creacion, imagen_url: @imagen.imagen_url, objeto_id: @imagen.objeto_id }
    end

    assert_redirected_to imagen_path(assigns(:imagen))
  end

  test "should show imagen" do
    get :show, id: @imagen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imagen
    assert_response :success
  end

  test "should update imagen" do
    put :update, id: @imagen, imagen: { cuerpo_id: @imagen.cuerpo_id, fecha_actualizacion: @imagen.fecha_actualizacion, fecha_creacion: @imagen.fecha_creacion, imagen_url: @imagen.imagen_url, objeto_id: @imagen.objeto_id }
    assert_redirected_to imagen_path(assigns(:imagen))
  end

  test "should destroy imagen" do
    assert_difference('Imagen.count', -1) do
      delete :destroy, id: @imagen
    end

    assert_redirected_to imagenes_path
  end
end
