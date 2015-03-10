class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  before_validation on: :create  do
    self.username = username.downcase.delete ' ' if attribute_present? "username"
  end
end
