class HashtagService
  def parse_input_for(tweet: required)
    hashtags = tweet.message.split.find_all{|word| /^#.+/.match word}
    hashtags.each do |hashtag|
      if Hashtag.exists? keyword: hashtag
        hashtag = Hashtag.find_by keyword: hashtag
        hashtag.tweets << tweet
      else
        Hashtag.create tweet_ids: [tweet.id], keyword: hashtag
      end
   end
  end

  def parse_output_for(tweet: required)
  end
end
