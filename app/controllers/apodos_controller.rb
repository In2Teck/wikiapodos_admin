class ApodosController < ApplicationController
  # GET /apodos
  # GET /apodos.json
  def index
    @apodos = Apodo.includes(:usuario, :compartidos, :apodos_usuarios).order("fecha_creacion DESC")

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

  def updateVisible
    @apodo = Apodo.find(params[:apodo_id])

    respond_to do |format|
      if @apodo.update_attribute(:visible, !@apodo.visible)
        format.json { render json: @apodo }
      else
        format.json { render json: {:error => "error"}}
      end
    end
  end

  def updateDestacado
    @apodo = Apodo.find(params[:apodo_id])

    respond_to do |format|
      if @apodo.update_attribute(:destacado, !@apodo.destacado)
        format.json { render json: @apodo }
      else
        format.json { render json: {:error => "error"}}
      end
    end
  end

end