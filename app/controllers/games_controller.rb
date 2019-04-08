class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    @search = params["search"]
    puts(@search)
    if @search.present?
      puts(@search[:name])
      @name = @search[:name]
      @games = Game.where("LOWER(name) LIKE ?", "%#{@name.downcase}%")
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @review = Review.new
    @reviews = @game.reviews
  end

  # GET /games/new
  def new
    @statusTypes = ["Relesed", "Beta", "Alpha"]
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.imageCounter = params[:game][:images].length

    if(params[:game][:status] != "Relesed")
      @game.relese_date = params[:game][:relese_date]
    end
    respond_to do |format|
      if @game.save
        counterForImages = 1
        params[:game][:images].each do |image|
          Cloudinary::Uploader.upload(image.tempfile.path, 
          :folder => "storby/" + params[:game][:name], :public_id => counterForImages.to_s, :overwrite => true, 
          :resource_type => "image")
          counterForImages += 1
        end
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
      @statusTypes = ["Relesed", "Beta", "Alpha"]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :desc, :price, :status, :search, source: [],)
    end
end
