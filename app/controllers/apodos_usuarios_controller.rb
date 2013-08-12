class ApodosUsuariosController < ApplicationController
  # GET /apodos_usuarios
  # GET /apodos_usuarios.json
  def index
    @apodos_usuarios = ApodosUsuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apodos_usuarios }
    end
  end

  # GET /apodos_usuarios/1
  # GET /apodos_usuarios/1.json
  def show
    @apodos_usuario = ApodosUsuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apodos_usuario }
    end
  end

  # GET /apodos_usuarios/new
  # GET /apodos_usuarios/new.json
  def new
    @apodos_usuario = ApodosUsuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apodos_usuario }
    end
  end

  # GET /apodos_usuarios/1/edit
  def edit
    @apodos_usuario = ApodosUsuario.find(params[:id])
  end

  # POST /apodos_usuarios
  # POST /apodos_usuarios.json
  def create
    @apodos_usuario = ApodosUsuario.new(params[:apodos_usuario])

    respond_to do |format|
      if @apodos_usuario.save
        format.html { redirect_to @apodos_usuario, notice: 'Apodos usuario was successfully created.' }
        format.json { render json: @apodos_usuario, status: :created, location: @apodos_usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @apodos_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apodos_usuarios/1
  # PUT /apodos_usuarios/1.json
  def update
    @apodos_usuario = ApodosUsuario.find(params[:id])

    respond_to do |format|
      if @apodos_usuario.update_attributes(params[:apodos_usuario])
        format.html { redirect_to @apodos_usuario, notice: 'Apodos usuario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apodos_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apodos_usuarios/1
  # DELETE /apodos_usuarios/1.json
  def destroy
    @apodos_usuario = ApodosUsuario.find(params[:id])
    @apodos_usuario.destroy

    respond_to do |format|
      format.html { redirect_to apodos_usuarios_url }
      format.json { head :no_content }
    end
  end

  def incidencias
    @apodos_usuarios = ApodosUsuario.where("status = 2").order("fecha_actualizacion DESC").includes(:apodo, :usuario_para)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apodos_usuarios }
    end
  end

end
