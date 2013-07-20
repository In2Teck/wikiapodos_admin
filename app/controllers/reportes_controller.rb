class ReportesController < ApplicationController
  # GET /reportes
  # GET /reportes.json
  def index
    @reportes = Reportes.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reportes }
    end
  end

  # GET /reportes/1
  # GET /reportes/1.json
  def show
    @reportes = Reportes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reportes }
    end
  end

  # GET /reportes/new
  # GET /reportes/new.json
  def new
    @reportes = Reportes.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reportes }
    end
  end

  # GET /reportes/1/edit
  def edit
    @reportes = Reportes.find(params[:id])
  end

  # POST /reportes
  # POST /reportes.json
  def create
    @reportes = Reportes.new(params[:reportes])

    respond_to do |format|
      if @reportes.save
        format.html { redirect_to @reportes, notice: 'Reportes was successfully created.' }
        format.json { render json: @reportes, status: :created, location: @reportes }
      else
        format.html { render action: "new" }
        format.json { render json: @reportes.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reportes/1
  # PUT /reportes/1.json
  def update
    @reportes = Reportes.find(params[:id])

    respond_to do |format|
      if @reportes.update_attributes(params[:reportes])
        format.html { redirect_to @reportes, notice: 'Reportes was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reportes.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reportes/1
  # DELETE /reportes/1.json
  def destroy
    @reportes = Reportes.find(params[:id])
    @reportes.destroy

    respond_to do |format|
      format.html { redirect_to reportes_index_url }
      format.json { head :no_content }
    end
  end
end
