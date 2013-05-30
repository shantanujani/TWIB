class SessionsController < ApplicationController

  def destroy
    session["user_id"] = nil
    redirect_to "/games", notice: "Come back soon!"
  end

  def new
  end

  def create
    user = User.find_by_user_first_name(params["user_first_name"])

    if user && user.authenticate(params["password"])
      session["user_id"] = user.id
      redirect_to "/games", notice: "Welcome back, #{user.name}"
    else
      redirect_to "/login", notice: "Unknown username or password."
    end

  end
end
