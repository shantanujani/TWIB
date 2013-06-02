class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_secure_password
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
end
