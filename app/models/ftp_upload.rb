class FtpUpload

  require 'net/ftp'
  
  def self.upload_apodo file
    domain = ENV['FTP_DOMAIN']
    username = ENV['FTP_USERNAME']
    password = ENV['FTP_PASSWORD']
    path_on_server = "/public/php1/wikiapodos/images/apodos"
    upload_file domain, username, password, path_on_server, file
  end 

  def self.upload_file domain, username, password, path_on_server, file

    begin
      filename = "#{Time.now.to_i}_#{file.original_filename}"
      ftp = Net::FTP.new(domain)
      ftp.passive = true
      ftp.login(username, password)
      ftp.chdir(path_on_server)
      ftp.storbinary("STOR #{filename}", StringIO.new(file.read), Net::FTP::DEFAULT_BLOCKSIZE)
      ftp.close
      return filename
    rescue
      return nil
    end

  end

end
