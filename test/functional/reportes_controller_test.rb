require 'test_helper'

class ReportesControllerTest < ActionController::TestCase
  setup do
    @reportes = reportes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reportes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reportes" do
    assert_difference('Reportes.count') do
      post :create, reportes: { apodo_id: @reportes.apodo_id, fecha: @reportes.fecha, fecha_actualizacion: @reportes.fecha_actualizacion, fecha_creacion: @reportes.fecha_creacion, razon: @reportes.razon, usuario_id: @reportes.usuario_id }
    end

    assert_redirected_to reportes_path(assigns(:reportes))
  end

  test "should show reportes" do
    get :show, id: @reportes
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reportes
    assert_response :success
  end

  test "should update reportes" do
    put :update, id: @reportes, reportes: { apodo_id: @reportes.apodo_id, fecha: @reportes.fecha, fecha_actualizacion: @reportes.fecha_actualizacion, fecha_creacion: @reportes.fecha_creacion, razon: @reportes.razon, usuario_id: @reportes.usuario_id }
    assert_redirected_to reportes_path(assigns(:reportes))
  end

  test "should destroy reportes" do
    assert_difference('Reportes.count', -1) do
      delete :destroy, id: @reportes
    end

    assert_redirected_to reportes_index_path
  end
end
