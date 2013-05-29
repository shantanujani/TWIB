# class LineValidator < ActiveModel::Validator
#   def validate(line)
#     unless line.to_s.length < 3
#       line.errors[:line] << 'Please provide a valide line.'
#     end
#   end
# end

class Game < ActiveRecord::Base

belongs_to :home_team, class_name: 'Team'
belongs_to :visiting_team, class_name: 'Team'


validates :line,:numericality => true
# validates_with LineValidator


end




