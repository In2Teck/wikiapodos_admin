class DisplayController < ApplicationController

	def index
    @apodos = Apodo.all.length
    @usuarios = Usuario.all.length
    @apodados = ApodosUsuario.all
    @quejas = @apodados.select {|item| item.status == "2"}.length
	end

  def remind_usuarios
    @usuarios = ApodosUsuario.find_by_sql("select distinct usuario_desde_id from (select usuario_desde_id, usuario_para_id, facebook_id from apodos_usuarios left join usuarios on facebook_id = usuario_para_id) as test where facebook_id is null")

    respond_to do |format|
      format.json { render json: @usuarios}
    end
  end

  def clear_contest
    UsuariosConcursos.delete_all
    Apodo.update_all(:es_estrella => 0)
    Usuario.update_all(:encontro_apodos => false, :encontro_apodos_timestamp => nil)

    respond_to do |format|
      format.json { render json: {:result => 'ok'}}
    end
  end

  def test_upload

  end

  def test_upload_send
    imagen = params[:imagen]
    result = FtpUpload.upload_apodo imagen
    render :json => result
  end
	
end
