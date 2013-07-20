class CompartidosController < ApplicationController
  # GET /compartidos
  # GET /compartidos.json
  def index
    @compartidos = Compartido.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @compartidos }
    end
  end

  # GET /compartidos/1
  # GET /compartidos/1.json
  def show
    @compartido = Compartido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @compartido }
    end
  end

  # GET /compartidos/new
  # GET /compartidos/new.json
  def new
    @compartido = Compartido.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @compartido }
    end
  end

  # GET /compartidos/1/edit
  def edit
    @compartido = Compartido.find(params[:id])
  end

  # POST /compartidos
  # POST /compartidos.json
  def create
    @compartido = Compartido.new(params[:compartido])

    respond_to do |format|
      if @compartido.save
        format.html { redirect_to @compartido, notice: 'Compartido was successfully created.' }
        format.json { render json: @compartido, status: :created, location: @compartido }
      else
        format.html { render action: "new" }
        format.json { render json: @compartido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /compartidos/1
  # PUT /compartidos/1.json
  def update
    @compartido = Compartido.find(params[:id])

    respond_to do |format|
      if @compartido.update_attributes(params[:compartido])
        format.html { redirect_to @compartido, notice: 'Compartido was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @compartido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compartidos/1
  # DELETE /compartidos/1.json
  def destroy
    @compartido = Compartido.find(params[:id])
    @compartido.destroy

    respond_to do |format|
      format.html { redirect_to compartidos_url }
      format.json { head :no_content }
    end
  end
end
