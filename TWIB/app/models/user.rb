class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_secure_password

  has_many :bets
  has_many :games, :through => :bets

  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
end
