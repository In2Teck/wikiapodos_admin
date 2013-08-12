class DisplayController < ApplicationController

	def index
    @apodos = Apodo.all.length
    @usuarios = Usuario.all.length
    @apodados = ApodosUsuario.all
    @quejas = @apodados.select {|item| item.status == "2"}.length
	end

  def test_upload

  end

  def test_upload_send
    imagen = params[:imagen]
    result = FtpUpload.upload_apodo imagen
    render :json => result
  end
	
end
