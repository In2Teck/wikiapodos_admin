class CuerposController < ApplicationController
  # GET /cuerpos
  # GET /cuerpos.json
  def index
    @cuerpos = Cuerpo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cuerpos }
    end
  end

  # GET /cuerpos/1
  # GET /cuerpos/1.json
  def show
    @cuerpo = Cuerpo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cuerpo }
    end
  end

  # GET /cuerpos/new
  # GET /cuerpos/new.json
  def new
    @cuerpo = Cuerpo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cuerpo }
    end
  end

  # GET /cuerpos/1/edit
  def edit
    @cuerpo = Cuerpo.find(params[:id])
  end

  # POST /cuerpos
  # POST /cuerpos.json
  def create
    @cuerpo = Cuerpo.new(params[:cuerpo])

    respond_to do |format|
      if @cuerpo.save
        format.html { redirect_to @cuerpo, notice: 'Cuerpo was successfully created.' }
        format.json { render json: @cuerpo, status: :created, location: @cuerpo }
      else
        format.html { render action: "new" }
        format.json { render json: @cuerpo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cuerpos/1
  # PUT /cuerpos/1.json
  def update
    @cuerpo = Cuerpo.find(params[:id])

    respond_to do |format|
      if @cuerpo.update_attributes(params[:cuerpo])
        format.html { redirect_to @cuerpo, notice: 'Cuerpo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cuerpo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuerpos/1
  # DELETE /cuerpos/1.json
  def destroy
    @cuerpo = Cuerpo.find(params[:id])
    @cuerpo.destroy

    respond_to do |format|
      format.html { redirect_to cuerpos_url }
      format.json { head :no_content }
    end
  end
end
