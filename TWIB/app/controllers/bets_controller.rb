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
    @bet.away_bets_awarded = 0
    @bet.home_bets_awarded = 0

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
    @game_id = @bet.game_id

    @bet.home_bets_placed = params[:home_bet]
    @bet.away_bets_placed = params[:away_bet]
    @bet.home_bets_awarded = params[:home_bet_awarded]
    @bet.away_bets_awarded = params[:away_bet_awarded]

    if @bet.save
      redirect_to game_url(@game_id)
    elsif
      redirect_to edit_bet_url, notice: "There was an error, please try again."
    end


    # respond_to do |format|
    #   if @bet.update_attributes(params[:bet])
    #     format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @bet.errors, status: :unprocessable_entity }
    #   end
    # end
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

  def award_bets

    @game = Game.find(params[:id])
    @bets = @game.bets
    # @bet = Bet.all
    # @game_id = @bet.game_id

    bucket = Array.new

    total_home_bets_placed = @bets.sum(:home_bets_placed)
    total_away_bets_placed = @bets.sum(:away_bets_placed)

    if @bets.sum(:home_bets_awarded) == @bets.sum(:away_bets_awarded) && @bets.sum(:home_bets_awarded) != 0

      return redirect_to game_url(@game), notice: "You've already run the script for this game."

    elsif total_home_bets_placed == total_away_bets_placed
        @bets.each do |bet|
          bet.away_bets_awarded = bet.away_bets_placed
          bet.home_bets_awarded = bet.home_bets_placed
          bet.save
        end


    elsif total_home_bets_placed < total_away_bets_placed

        @bets.each do |bet|
          bet.home_bets_awarded = bet.home_bets_placed
          bet.save
        end

        for i in 0..@bets.count-1
          if @bets[i].away_bets_placed != 0
            bucket[i] = @bets[i]
          end
          bucket.compact!
        end


        total_away_bets_awarded = 0

        # for i in 0..2000
        # for i in 0..@bets.sum(:home_bets_placed)
        while total_away_bets_awarded < total_home_bets_placed
          # bet_element = bucket.sample
          y = bucket.sample
          x = y.id
          bet_element = @bets.find_by_id(x)
          # bet_element = bucket.sample.away_bets_awarded

          if bet_element.away_bets_awarded < bet_element.away_bets_placed
            bet_element.away_bets_awarded += 1
            bet_element.save
            total_away_bets_awarded +=1
          else
            bucket.delete(bet_element)
            # i = i-2
          end
        end
        # end

        # if @bets.save
        #   redirect_to game_url(@game_id)
        # elsif
        #   redirect_to game_url(@game_id), notice: "There was an error, please try again."
        # end
    else
        @bets.each do |bet|
          bet.away_bets_awarded = bet.away_bets_placed
          bet.save
        end

        for i in 0..@bets.count-1
          if @bets[i].home_bets_placed != 0
            bucket[i] = @bets[i]
          end
          bucket.compact!
        end


        total_home_bets_awarded = 0

        # for i in 0..2000
        # for i in 0..@bets.sum(:home_bets_placed)
        while total_home_bets_awarded < total_away_bets_placed
          # bet_element = bucket.sample
          y = bucket.sample
          x = y.id
          bet_element = @bets.find_by_id(x)
          # bet_element = bucket.sample.away_bets_awarded

          if bet_element.home_bets_awarded < bet_element.home_bets_placed
            bet_element.home_bets_awarded += 1
            bet_element.save
            total_home_bets_awarded +=1
          else
            bucket.delete(bet_element)
            # i = i-2
          end
        end

    end
    redirect_to game_url(@game)
  end
end
