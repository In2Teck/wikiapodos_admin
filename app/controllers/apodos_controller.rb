﻿class ApodosController < ApplicationController
  # GET /apodos
  # GET /apodos.json
  def index
    @filter = params[:filter]
    if @filter != nil && @filter != ''
      @apodos = Apodo.find_by_sql("SELECT apodos.*, usuarios.nombre as 'nombre_usuario', usuarios.apellido, usuarios.facebook_id, sum(apodos_usuarios.status = 1) as 'aceptado', sum(apodos_usuarios.status = 2) as 'reportado', count(DISTINCT compartidos.apodo_id) as 'compartido' from apodos LEFT OUTER JOIN usuarios on usuarios.facebook_id = apodos.autor_id LEFT OUTER JOIN apodos_usuarios on apodos_usuarios.apodo_id = apodos.id LEFT OUTER JOIN compartidos on compartidos.apodo_id = apodos.id  WHERE apodos.nombre like '#{@filter}%'GROUP BY apodos.id ORDER BY #{sort_column} #{sort_direction}").paginate(:page => params[:page])
    else
      @apodos = Apodo.find_by_sql("SELECT apodos.*, usuarios.nombre as 'nombre_usuario', usuarios.apellido, usuarios.facebook_id, sum(apodos_usuarios.status = 1) as 'aceptado', sum(apodos_usuarios.status = 2) as 'reportado', count(DISTINCT compartidos.apodo_id) as 'compartido' from apodos LEFT OUTER JOIN usuarios on usuarios.facebook_id = apodos.autor_id LEFT OUTER JOIN apodos_usuarios on apodos_usuarios.apodo_id = apodos.id LEFT OUTER JOIN compartidos on compartidos.apodo_id = apodos.id GROUP BY apodos.id ORDER BY #{sort_column} #{sort_direction}").paginate(:page => params[:page])  
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apodos }
    end
  end

  # GET /apodos/1
  # GET /apodos/1.json
  def show
    @apodo = Apodo.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apodo }
    end
  end

  # GET /apodos/new
  # GET /apodos/new.json
  def new
    @apodo = Apodo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apodo }
    end
  end

  # GET /apodos/1/edit
  def edit
    @apodo = Apodo.find(params[:id])
  end

  # POST /apodos
  # POST /apodos.json
  def create
    @apodo = Apodo.new(params[:apodo])

    respond_to do |format|
      if @apodo.save
        format.html { redirect_to @apodo, notice: 'Apodo was successfully created.' }
        format.json { render json: @apodo, status: :created, location: @apodo }
      else
        format.html { render action: "new" }
        format.json { render json: @apodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apodos/1
  # PUT /apodos/1.json
  def update
    @apodo = Apodo.find(params[:id])
    imagen = params[:apodo][:imagen_url]

    if imagen
      params[:apodo][:imagen_url] = FtpUpload.upload_apodo imagen
    end

    respond_to do |format|
      if @apodo.update_attributes(params[:apodo])
        format.html { redirect_to "/apodos/#{@apodo.id}/edit", notice: 'El apodo se actualizó correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apodos/1
  # DELETE /apodos/1.json
  def destroy
    @apodo = Apodo.find(params[:id])
    @apodo.destroy

    respond_to do |format|
      format.html { redirect_to apodos_url }
      format.json { head :no_content }
    end
  end

  def update_visible
    @apodo = Apodo.find(params[:apodo_id])

    respond_to do |format|
      if @apodo.update_attribute(:visible, !@apodo.visible)
        format.json { render json: @apodo }
      else
        format.json { render json: {:error => "error"}}
      end
    end
  end

  def update_destacado
    @apodo = Apodo.find(params[:apodo_id])

    respond_to do |format|
      if @apodo.update_attribute(:destacado, !@apodo.destacado)
        format.json { render json: @apodo }
      else
        format.json { render json: {:error => "error"}}
      end
    end
  end

  def get_usuarios
     @usuarios = ApodosUsuario.where("apodo_id = ? and status = 1", params[:apodo_id]).includes(:usuario_para)

    respond_to do |format|
      format.json { render json: @usuarios, :include => :usuario_para}
    end
  end

  def update_estrella
    @apodo = Apodo.find(params[:apodo_id])
    newVal = @apodo.es_estrella == 0 ? 1 : 0

    respond_to do |format|
      if @apodo.update_attribute(:es_estrella, newVal)
        format.json { render json: @apodo }
      else
        format.json { render json: {:error => "error"}}
      end
    end
  end

end
