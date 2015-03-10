class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true, associated: true

  validates :content, presence: true
end
