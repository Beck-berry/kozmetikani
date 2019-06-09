class KezelesController < ApplicationController
  before_action :set_kezele, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  # GET /kezeles
  # GET /kezeles.json
  public
  def index
    @kezeles = Kezele.all
  end

  # GET /kezeles/1
  # GET /kezeles/1.json
  def show
  end

  # GET /kezeles/new
  def new
    @kezele = Kezele.new
  end

  # GET /kezeles/1/edit
  def edit
  end

  # POST /kezeles
  # POST /kezeles.json
  def create
    @kezele = Kezele.new(kezele_params)

    respond_to do |format|
      if @kezele.save
        format.html { redirect_to @kezele, notice: t('message.treat_created') }
        format.json { render :show, status: :created, location: @kezele }
      else
        format.html { render :new }
        format.json { render json: @kezele.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kezeles/1
  # PATCH/PUT /kezeles/1.json
  def update
    respond_to do |format|
      if @kezele.update(kezele_params)
        format.html { redirect_to @kezele, notice: t('message.treat_updated') }
        format.json { render :show, status: :ok, location: @kezele }
      else
        format.html { render :edit }
        format.json { render json: @kezele.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kezeles/1
  # DELETE /kezeles/1.json
  def destroy
    @kezele.destroy
    respond_to do |format|
      format.html { redirect_to kezeles_url, notice: t('message.treat_destroyed') }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_kezele
    @kezele = Kezele.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def kezele_params
    params.require(:kezele).permit(:name, :minutes, :price, :desc)
  end
end