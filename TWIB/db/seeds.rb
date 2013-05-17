# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


data = [{team_name: "Dallas Cowboys", division: "East"}, {team_name: "Philadelphia Eagles", division: "East"}, {team_name: "Atlanta Falcons", division: "South"}, {team_name: "Carolina Panthers", division: "South"}]
data.each do |data|
  t = Team.new
  t.team_name = data.fetch(:team_name)
  t.conference = "NFC"
  t.division = data.fetch(:division)
  t.save
end

puts "There are now #{Team.count} teams."
