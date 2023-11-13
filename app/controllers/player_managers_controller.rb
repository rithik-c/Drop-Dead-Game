class PlayerManagersController < ApplicationController
  before_action :set_player_manager, only: %i[ show edit update destroy ]

  # GET /player_managers or /player_managers.json
  def index
    @player_managers = PlayerManager.all
  end

  # GET /player_managers/1 or /player_managers/1.json
  def show
  end

  # GET /player_managers/new
  def new
    @player_manager = PlayerManager.new
  end

  # GET /player_managers/1/edit
  def edit
  end

  # POST /player_managers or /player_managers.json
  def create
    @player_manager = PlayerManager.new(player_manager_params)

    respond_to do |format|
      if @player_manager.save
        format.html { redirect_to player_manager_url(@player_manager), notice: "Player manager was successfully created." }
        format.json { render :show, status: :created, location: @player_manager }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_managers/1 or /player_managers/1.json
  def update
    respond_to do |format|
      if @player_manager.update(player_manager_params)
        format.html { redirect_to player_manager_url(@player_manager), notice: "Player manager was successfully updated." }
        format.json { render :show, status: :ok, location: @player_manager }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_managers/1 or /player_managers/1.json
  def destroy
    @player_manager.destroy

    respond_to do |format|
      format.html { redirect_to player_managers_url, notice: "Player manager was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_manager
      @player_manager = PlayerManager.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_manager_params
      params.fetch(:player_manager, {})
    end
end
