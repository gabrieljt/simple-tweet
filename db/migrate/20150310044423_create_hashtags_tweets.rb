class CreateHashtagsTweets < ActiveRecord::Migration
  def change
    create_table :hashtags_tweets do |t|
      t.references :hashtag, index: true
      t.references :tweet, index: true
    end
    add_foreign_key :hashtags_tweets, :hashtags
    add_foreign_key :hashtags_tweets, :tweets
  end
end
