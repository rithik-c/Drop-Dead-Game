class AutoDropDeadsController < ApplicationController
  before_action :set_auto_drop_dead, only: %i[ show edit update destroy ]

  # GET /auto_drop_deads or /auto_drop_deads.json
  def index
    @auto_drop_deads = AutoDropDead.all
  end

  # GET /auto_drop_deads/1 or /auto_drop_deads/1.json
  def show
    @auto_drop_dead = AutoDropDead.find(params[:id])
    @user_id = session[:user_id]
  end

  def show_result
    @auto_drop_dead = AutoDropDead.find(params[:id])
    @user_id = session[:user_id]
  end
  
  def show_game
    @auto_drop_dead = AutoDropDead.find(params[:id])
    @user_id = session[:user_id]
  end

  # GET /auto_drop_deads/new
  def new
    @auto_drop_dead = AutoDropDead.new
    @user_id = session[:user_id]
  end

  # GET /auto_drop_deads/1/edit
  def edit
  end

  # POST /auto_drop_deads or /auto_drop_deads.json
  def create
    @auto_drop_dead = AutoDropDead.new(auto_drop_dead_params)
    
    @user_id = session[:user_id]
    user = User.find(@user_id)
    game_history = user.game_history
    @auto_drop_dead.game_history_id = game_history.id
    
    @game = Logic::AutoDropDead.new
    @auto_drop_dead.game_output = @game.play_game(@auto_drop_dead.sides, @auto_drop_dead.dice_count, @auto_drop_dead.player_count)

    respond_to do |format|
      if @auto_drop_dead.save
        format.html { redirect_to show_result_auto_drop_dead_path(@auto_drop_dead), notice: "Auto drop dead was successfully created." }
        format.json { render :show, status: :created, location: @auto_drop_dead }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @auto_drop_dead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auto_drop_deads/1 or /auto_drop_deads/1.json
  def update
    respond_to do |format|
      if @auto_drop_dead.update(auto_drop_dead_params)
        format.html { redirect_to auto_drop_dead_url(@auto_drop_dead), notice: "Auto drop dead was successfully updated." }
        format.json { render :show, status: :ok, location: @auto_drop_dead }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @auto_drop_dead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auto_drop_deads/1 or /auto_drop_deads/1.json
  def destroy
    @auto_drop_dead.destroy

    respond_to do |format|
      format.html { redirect_to auto_drop_deads_url, notice: "Auto drop dead was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto_drop_dead
      @auto_drop_dead = AutoDropDead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def auto_drop_dead_params
      params.require(:auto_drop_dead).permit(:sides, :dice_count, :player_count)
    end
end
