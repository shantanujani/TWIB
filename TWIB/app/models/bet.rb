class Bet < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :game
end
