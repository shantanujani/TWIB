  class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by_id(params[:id])
  end

  def new
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
      redirect_to '/games/new', notice: "you screwed up again."
    end
  end

  def edit
    @game = Game.find_by_id(params[:id])
  end

  def update
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
end
