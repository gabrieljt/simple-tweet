class Tweet < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :hashtags

  validates :user, presence: true, associated: true

  validates :content, presence: true

  default_scope { order created_at: :desc }
end
