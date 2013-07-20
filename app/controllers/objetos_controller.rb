class ObjetosController < ApplicationController
  # GET /objetos
  # GET /objetos.json
  def index
    @objetos = Objeto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @objetos }
    end
  end

  # GET /objetos/1
  # GET /objetos/1.json
  def show
    @objeto = Objeto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @objeto }
    end
  end

  # GET /objetos/new
  # GET /objetos/new.json
  def new
    @objeto = Objeto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @objeto }
    end
  end

  # GET /objetos/1/edit
  def edit
    @objeto = Objeto.find(params[:id])
  end

  # POST /objetos
  # POST /objetos.json
  def create
    @objeto = Objeto.new(params[:objeto])

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: 'Objeto was successfully created.' }
        format.json { render json: @objeto, status: :created, location: @objeto }
      else
        format.html { render action: "new" }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /objetos/1
  # PUT /objetos/1.json
  def update
    @objeto = Objeto.find(params[:id])

    respond_to do |format|
      if @objeto.update_attributes(params[:objeto])
        format.html { redirect_to @objeto, notice: 'Objeto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objetos/1
  # DELETE /objetos/1.json
  def destroy
    @objeto = Objeto.find(params[:id])
    @objeto.destroy

    respond_to do |format|
      format.html { redirect_to objetos_url }
      format.json { head :no_content }
    end
  end
end
