class Game < ActiveRecord::Base

belongs_to :home_team, class_name: 'Team'
belongs_to :visiting_team, class_name: 'Team'

has_many :bets
has_many :users, :through => :bets

validates :line, :numericality => true
validates_format_of :line, :with => /^(-|^)\d+\.(0|5)\d{0,1}$/

def game_details
  "#{home_team.team_name} vs. #{visiting_team.team_name}, #{line}"
end


end




