class TeamsController < ApplicationController

before_filter :correct_user, :except => [:new, :create]


 def correct_user
    if session["user_id"].blank?
      return redirect_to '/', notice: "Please sign in first."
    elsif User.find_by_id(session["user_id"]).commissioner != "Site Admin"
      return redirect_to '/games', notice: "You are not authorized to see this page."
    end
  end

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find_by_id(params[:id])
  end

  def new
    if session["user_id"].blank?
      redirect_to '/teams', notice: "Please sign in first."
    end
    @team = Team.new
  end

  def create
    @team = Team.new
    @team.team_name = params[:team_name]
    @team.conference = params[:conference]
    @team.division = params[:division]

    if @team.save
      redirect_to teams_url
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find_by_id(params[:id])
  end

  def update
    @team = Team.find_by_id(params[:id])
    @team.team_name = params[:team_name]
    @team.conference = params[:conference]
    @team.division = params[:division]

    if @team.save
      redirect_to teams_url
    else
      render 'new'
    end
  end

  def destroy
    @team = Team.find_by_id(params[:id])
    @team.destroy
    redirect_to teams_url
  end
end
