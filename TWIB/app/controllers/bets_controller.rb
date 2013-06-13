class BetsController < ApplicationController

before_filter :correct_user, :except => [:new, :create, :index]


 def correct_user
    if session["user_id"].blank?
      return redirect_to '/', notice: "Please sign in first."
    elsif User.find_by_id(session["user_id"]).commissioner != "Site Admin"
      return redirect_to '/games', notice: "You are not authorized to see this page."
    end
  end

  # GET /bets
  # GET /bets.json
  def index

    @games = Game.all

    if User.find_by_id(session["user_id"]).commissioner != "Site Admin"
       @bets = Bet.find_all_by_user_id(session["user_id"])
     elsif
       @bets = Bet.all
     end


    # @bet = Bet.find_all_by_id(params[:id])
    # session["last_bet_id"] = @bet.id

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bets }
    end
  end

  # GET /bets/1
  # GET /bets/1.json
  def show
    @bet = Bet.find_all_by_id(params[:id])
    # session["last_bet_id"] = @bet.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bet }
    end
  end

  # GET /bets/new
  # GET /bets/new.json
  def new
    @bet = Bet.new
    @games = Game.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bet }
    end
  end

  # GET /bets/1/edit
  def edit
    @bet = Bet.find(params[:id])
  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new
    @bet.game_id = params[:game_id]
    @bet.user_id = session["user_id"]
    @bet.away_bets_placed = params[:away_bet]
    @bet.home_bets_placed = params[:home_bet]

    if @bet.save
      return redirect_to '/bets', notice: 'Bet was successfully created.'
        # format.json { render json: @bet, status: :created, location: @bet }
    else
      return redirect_to '/bets/new', notice: "You may only bet for the home team or the away team."
        # format.html { render action: "new" }
        # format.json { render json: @bet.errors, status: :unprocessable_entity }

    end
  end

  # PUT /bets/1
  # PUT /bets/1.json
  def update
    @bet = Bet.find(params[:id])

    respond_to do |format|
      if @bet.update_attributes(params[:bet])
        format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  def matchup
    @bets = Bet.find_all_by_game_id(session["user_id"])
end


  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy

    respond_to do |format|
      format.html { redirect_to bets_url }
      format.json { head :no_content }
    end
  end
end
