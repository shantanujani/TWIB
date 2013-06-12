class Game < ActiveRecord::Base

belongs_to :home_team, class_name: 'Team'
belongs_to :visiting_team, class_name: 'Team'

has_many :bets


validates :line,:numericality => true
validates_format_of :line, :with => /^(-|^)\d+\.(0|5)\d{0,1}$/



end




