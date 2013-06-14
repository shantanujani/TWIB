class ResultsController < ApplicationController

def results

  @games = User.find_by_id(session["user_id"]).games
  @wins = 0
  @losses = 0

  @games.each do |game|
    if game.home_team_result == "Won"
       @wins += game.bets.find_by_user_id(session["user_id"]).home_bets_awarded
       @losses += game.bets.find_by_user_id(session["user_id"]).away_bets_awarded
    elsif game.home_team_result == "Lost"
       @wins += game.bets.find_by_user_id(session["user_id"]).away_bets_awarded
       @losses += game.bets.find_by_user_id(session["user_id"]).home_bets_awarded
    end
    # @total = @wins + @losses
    # @ratio = (@wins.to_f/@total)
  @percentage = (@wins.to_f/(@wins + @losses))
  end



end





end
