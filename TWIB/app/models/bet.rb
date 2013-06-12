class Bet < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :game
  belongs_to :user
end
