class IdopontsController < ApplicationController
  before_action :set_idopont, only: [:show, :edit, :update, :destroy]

  # GET /idoponts
  # GET /idoponts.json
  def index
    @idoponts = Idopont.all
    #:user.email = User.find(params[@idopont.user_id]).email
  end

  # GET /idoponts/1
  # GET /idoponts/1.json
  def show
  end

  # GET /idoponts/new
  def new
    @idopont = Idopont.new
    @kezeles = Kezele.all
  end

  # GET /idoponts/1/edit
  def edit
  end

  # POST /idoponts
  # POST /idoponts.json
  def create
    @idopont = Idopont.new(idopont_params)
    @kezeles = Kezele.all

    @todos = Kezele.find(params[:todos])
    @needed_minutes = 0

    @todos.each do |todo|
      @idopont.todo.push(todo.name)
      @needed_minutes += todo.minutes
    end

    @idopont.user = current_user
    @idopont.toTime = Time.at(@idopont.fromTime.to_i + @needed_minutes*60 ).to_datetime

    respond_to do |format|
      if @idopont.save
        format.html { redirect_to @idopont, notice: t('message.appo_created') }
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
        format.html { redirect_to @idopont, notice: t('message.appo_updated') }
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
      format.html { redirect_to idoponts_url, notice: t('message.appo_destroyed') }
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
      params.require(:idopont).permit(:user, :fromTime)
    end
end
