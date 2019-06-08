class IdopontsController < ApplicationController
  before_action :set_idopont, only: [:show, :edit, :update, :destroy]

  # GET /idoponts
  # GET /idoponts.json
  def index
    @idoponts = Idopont.all
  end

  # GET /idoponts/1
  # GET /idoponts/1.json
  def show
  end

  # GET /idoponts/new
  def new
    @idopont = Idopont.new
  end

  # GET /idoponts/1/edit
  def edit
  end

  # POST /idoponts
  # POST /idoponts.json
  def create
    @idopont = Idopont.new(idopont_params)

    respond_to do |format|
      if @idopont.save
        format.html { redirect_to @idopont, notice: 'Idopont was successfully created.' }
        format.json { render :show, status: :created, location: @idopont }
      else
        format.html { render :new }
        format.json { render json: @idopont.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idoponts/1
  # PATCH/PUT /idoponts/1.json
  def update
    respond_to do |format|
      if @idopont.update(idopont_params)
        format.html { redirect_to @idopont, notice: 'Idopont was successfully updated.' }
        format.json { render :show, status: :ok, location: @idopont }
      else
        format.html { render :edit }
        format.json { render json: @idopont.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idoponts/1
  # DELETE /idoponts/1.json
  def destroy
    @idopont.destroy
    respond_to do |format|
      format.html { redirect_to idoponts_url, notice: 'Idopont was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idopont
      @idopont = Idopont.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idopont_params
      params.fetch(:idopont, {})
    end
end
