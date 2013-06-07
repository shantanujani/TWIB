class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :signed_in_user
  # before_filter :correct_user

  def signed_in_user
    redirect_to '/', notice: "Please sign up or log-in." unless session["user_id"].present?
  end

  # def correct_user
  #   if session["user_id"].blank?
  #     return redirect_to '/', notice: "Please sign in first."
  #   elsif User.find_by_id(session["user_id"]).commissioner != "Site Admin"
  #     return redirect_to '/games', notice: "You are not authorized to see this page."
  #   end
  # end


end
