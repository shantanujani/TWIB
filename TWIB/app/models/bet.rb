class Bet < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :game
  belongs_to :user

  # validates :home_bets_placed, :presence => true, :if => :away_bets_placed.blank?
  # validates :home_bets_placed, :numericality => true
  # validates :home_bets_placed, :presence => true, :if => :away_bets_placed.blank?
  # validates :away_bets_placed, :numericality => true

  # validate :you_can_only_bet_on_one_side

  # def you_can_only_bet_on_one_side
  #   if # condition
  #     self.errors.add(:home_bets_placed, "Nice try.")
  #   end
  # end
end
