class CamilosController < ApplicationController
  before_action :set_camilo, only: [:show, :edit, :update, :destroy]

  # GET /camilos
  # GET /camilos.json
  def index
    @camilos = Camilo.all
  end

  # GET /camilos/1
  # GET /camilos/1.json
  def show
  end

  # GET /camilos/new
  def new
    @camilo = Camilo.new
  end

  # GET /camilos/1/edit
  def edit
  end

  # POST /camilos
  # POST /camilos.json
  def create
    @camilo = Camilo.new(camilo_params)

    respond_to do |format|
      if @camilo.save
        format.html { redirect_to @camilo, notice: 'Camilo was successfully created.' }
        format.json { render :show, status: :created, location: @camilo }
      else
        format.html { render :new }
        format.json { render json: @camilo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camilos/1
  # PATCH/PUT /camilos/1.json
  def update
    respond_to do |format|
      if @camilo.update(camilo_params)
        format.html { redirect_to @camilo, notice: 'Camilo was successfully updated.' }
        format.json { render :show, status: :ok, location: @camilo }
      else
        format.html { render :edit }
        format.json { render json: @camilo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camilos/1
  # DELETE /camilos/1.json
  def destroy
    @camilo.destroy
    respond_to do |format|
      format.html { redirect_to camilos_url, notice: 'Camilo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camilo
      @camilo = Camilo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camilo_params
      params.require(:camilo).permit(:name, :age)
    end
end
