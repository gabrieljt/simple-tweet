class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_validation on: :create  do
    self.username = username.delete ' ' if attribute_present? "username"
  end
end
