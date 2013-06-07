class UsersController < ApplicationController

before_filter :correct_user, :except => [:new, :create]
skip_before_filter :signed_in_user, :only => [:new, :create]


 def correct_user
    if session["user_id"].blank?
      return redirect_to '/', notice: "Please sign in first."
    elsif User.find_by_id(session["user_id"]).commissioner != "Site Admin"
      return redirect_to '/games', notice: "You are not authorized to see this page."
    end
  end

def index
  # if session["user_id"].blank?
  #     redirect_to '/games', notice: "Please sign in first."
  # end

  # if session["user_id"].present?
  #   if User.find_by_id(session["user_id"]).commissioner != "Site Admin"
  #       redirect_to '/games', notice: "You are not authorized to see this page."
  #   end
  # end

  # if session["user_id"].blank?
  #     return redirect_to '/games', notice: "Please sign in first."
  #   elsif User.find_by_id(session["user_id"]).commissioner != "Site Admin"
  #     return redirect_to '/games', notice: "You are not authorized to see this page."
  # end

  @users = User.all
end

def show
  @user = User.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @user }
  end
end

def new
  # if session["user_id"].blank?
  #     return redirect_to '/games', notice: "Please sign in first."
  # end


  # if session["user_id"].present?
  #   if User.find_by_id(session["user_id"]).commissioner != "Site Admin"
  #       return redirect_to '/games', notice: "You are not authorized to see this page."
  #   end
  # end


  # if session["user_id"].blank?
  #     return redirect_to '/games', notice: "Please sign in first."
  #   elsif User.find_by_id(session["user_id"]).commissioner != "Site Admin"
  #     return redirect_to '/games', notice: "You are not authorized to see this page."
  # end


  @user = User.new

  respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @user }
  end
end

def create
  @user = User.new
  @user.username = params[:username]
  @user.password = params[:password]
  @user.commissioner = "user"
  # @user.unit = params[:unit]

  if @user.save
    session["user_id"] = @user.id
    redirect_to games_url
  else
    redirect_to '/users/new', notice: "Username is already taken. Please pick a new one."
  end
end

def edit
  @user = User.find_by_id(params[:id])
end

def update
  @user = User.find_by_id(params[:id])
  @user.username = params[:username]
  @user.commissioner = params[:commissioner]
  @user.password = params[:password]

  if @user && @user.authenticate(params["password"])
      if @user.save
        redirect_to users_url, notice: "User admin levels changed."
      else
        redirect_to edit_user_url, notice: "User changes not saved - incorrect password."
      end
  elsif redirect_to edit_user_url, notice: "User changes not saved - you messed up."
  end

  # respond_to do |format|
  #   if @user.update_attributes(params[:user])
  #     format.html { redirect_to @user, notice: 'User Profile was successfully updated.' }
  #     format.json { head :no_content }
  #   else
  #     format.html { render action: "edit" }
  #     format.json { render json: @user.errors, status: :unprocessable_entity }
  #   end
  # end
end

def destroy
  @user = User.find(params[:id])
  @user.destroy

  respond_to do |format|
    format.html { redirect_to users_url }
    format.json { head :no_content }
  end
end
end
