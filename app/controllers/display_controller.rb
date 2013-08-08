class DisplayController < ApplicationController

	def index

	end

  def test_upload

  end

  def test_upload_send
    imagen = params[:imagen]
    result = FtpUpload.upload_apodo imagen
    render :json => result
  end
	
end
