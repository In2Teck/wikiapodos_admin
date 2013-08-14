class UsuariosController < ApplicationController
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.find_by_sql("SELECT usuarios.id, usuarios.facebook_id, usuarios.es_fan, usuarios.nombre, usuarios.apellido, usuarios.email, usuarios.fecha_creacion, count(distinct usuarios_desde.id) as 'amigos_apodados', count(distinct usuarios_para.id) as 'apodos_recibidos', count(distinct apodos.id) as 'apodos_creados'
FROM usuarios LEFT OUTER JOIN apodos_usuarios as usuarios_para ON usuarios.facebook_id = usuarios_para.usuario_para_id AND usuarios_para.status = '1' LEFT OUTER JOIN apodos_usuarios as usuarios_desde ON usuarios.facebook_id = usuarios_desde.usuario_desde_id AND usuarios_desde.status = '1' LEFT OUTER JOIN apodos ON usuarios.facebook_id = apodos.autor_id GROUP BY usuarios.facebook_id ORDER BY #{sort_column} #{sort_direction}").paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuarios }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(params[:usuario])

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render json: @usuario, status: :created, location: @usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end

  def get_apodos_creados
    @apodos = Apodo.where("autor_id = ?", params[:usuario_id])
     respond_to do |format|
      format.json { render json: @apodos }
    end
  end

  def get_apodos_asignados
    @apodos = ApodosUsuario.where("usuario_para_id = ? and status = 1", params[:usuario_id]).includes(:apodo)
     respond_to do |format|
      format.json { render json: @apodos, :include => :apodo }
    end
  end

end
