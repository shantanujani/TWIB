class SessionsController < ApplicationController

skip_before_filter :signed_in_user, :only => [:create, :new]
skip_before_filter :correct_user, :only => [:create, :new]


  def destroy
    session["user_id"] = nil
    redirect_to "/", notice: "Come back soon!"
  end

  def new
  end

  def create
    user = User.find_by_username(params["username"])

    if user && user.authenticate(params["password"])
      session["user_id"] = user.id
      redirect_to "/games", notice: "Welcome back, #{user.username}"
    else
      redirect_to "/login", notice: "Unknown username or password."
    end

  end

  def verify
    user = User.find_by_username(params["username"])

    if user && user.authenticate(params["password"])
      user.commissioner = params[:commissioner]
      user.save
      redirect_to "/users", notice: "User admin levels changed."
    else
      redirect_to "/users/"
    end

  end
end
