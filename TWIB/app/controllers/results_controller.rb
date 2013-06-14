class ResultsController < ApplicationController

def results

  user = User.find(session["user_id"])
  @games = user.games
  @wins = 0
  @losses = 0

  @games.each do |game|
    if game.home_team_result == "Won"
       @wins += game.bets.find_by_user_id(user).home_bets_awarded
       @losses += game.bets.find_by_user_id(user).away_bets_awarded
    elsif game.home_team_result == "Lost"
       @wins += game.bets.find_by_user_id(user).away_bets_awarded
       @losses += game.bets.find_by_user_id(user).home_bets_awarded
    end
    # @total = @wins + @losses
    # @ratio = (@wins.to_f/@total)
  @percentage = (@wins.to_f/(@wins + @losses))
  end



end





end
