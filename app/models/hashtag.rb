class Hashtag < ActiveRecord::Base
  has_and_belongs_to_many :tweets

  validates :keyword, presence: true, uniqueness: true
end
