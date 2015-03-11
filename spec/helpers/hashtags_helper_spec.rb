require 'rails_helper'

RSpec.describe HashtagsHelper, :type => :helper do
  before do @tweet = create :tweet, message: 'oh, hi! #justTesting works? #yeah!' end

  describe '#parse_input' do
    it 'finds and creates Hashtags' do
      expect { parse_input_for tweet: @tweet }.to change(Hashtag, :count).by 2
    end

    it 'associates with tweet' do
      parse_input_for tweet: @tweet
      expect(Hashtag.first.tweet_ids).to include @tweet.id
      expect(Hashtag.second.tweet_ids).to include @tweet.id

      new_tweet = create :tweet, message: 'oh, hi! #justTesting once more'
      parse_input_for tweet: new_tweet
      expect(Hashtag.first.tweet_ids).to match_array [@tweet.id, new_tweet.id]
    end
  end

  describe '#parse_output' do
  end
end
