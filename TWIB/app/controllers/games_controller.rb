class GamesController < ApplicationController

before_filter :correct_user, :except => [:new, :create, :index]


 def correct_user
    if session["user_id"].blank?
      return redirect_to '/', notice: "Please sign in first."
    elsif User.find_by_id(session["user_id"]).commissioner != "Site Admin"
      return redirect_to '/games', notice: "You are not authorized to see this page."
    end
  end


  def index
    @games = Game.all


  end

  def show
    @game = Game.find_by_id(params[:id])
    @bet = Bet.find_all_by_game_id(params[:id])
  end

  def new
    if session["user_id"].blank?
      redirect_to '/games', notice: "Please sign in first."
    end

    @game = Game.new
  end

  def create
    @game = Game.new
    @game.home_team_id = params[:home_team_id]
    @game.visiting_team_id = params[:visiting_team_id]
    @game.line = params[:line]
    @game.home_team_result = params[:home_team_result]

    if @game.save
      redirect_to games_url
    else
      redirect_to '/games/new', notice: "There was an error, please try to create your game again."
    end
  end

  def edit
    @game = Game.find_by_id(params[:id])
  end

  def update
    @bet = Bet.find_all_by_game_id(params[:id])

    @game = Game.find_by_id(params[:id])
    @game.home_team_id = params[:home_team_id]
    @game.visiting_team_id = params[:visiting_team_id]
    @game.line = params[:line]
    @game.home_team_result = params[:home_team_result]

    if @game.save
      redirect_to games_url
    else
      redirect_to edit_game_url, notice: "There was an error. Make sure you entered a valid number for the line."
    end
  end

  def destroy
    @game = Game.find_by_id(params[:id])
    @game.destroy
    redirect_to games_url
  end

  def award_bets
    @bet = Bet.find_all_by_game_id(params[:id])
    total_home_bets_placed = 0
    total_away_bets_placed = 0

    @bet.each do |bet|
      if bet.home_bets_placed == nil
        total_home_bets_placed += 0
      elsif
        total_home_bets_placed += bet.home_bets_placed
      end
    end

    @bet.each do |bet|
      if bet.away_bets_placed == nil
        total_away_bets_placed += 0
      elsif
        total_away_bets_placed += bet.away_bets_placed
      end
    end

    if total_home_bets_placed == total_away_bets_placed
      @bet.each do |bet|
        bet.home_bets_awarded = bet.home_bets_placed
        bet.away_bets_awarded = bet.away_bets_placed
      end
    # elsif total_home_bets_placed > total_away_bets_placed
    end
  end
end
