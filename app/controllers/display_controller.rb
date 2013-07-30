class DisplayController < ApplicationController

	def index

	end

  def test_upload

  end

  def test_upload_send
    imagen = params[:imagen]
    FtpUpload.upload_apodo imagen
    render :json => "Ok" 
  end
	
end
