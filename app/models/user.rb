class User < ActiveRecord::Base
  has_many :tweets

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  before_validation on: :create  do
    self.username = username.delete ' ' if attribute_present? "username"
  end
end
