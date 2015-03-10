class User < ActiveRecord::Base
  has_many :tweets

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true

  before_validation on: :create  do
    self.username = username.downcase.delete ' ' if attribute_present? "username"
  end
end
