module HashtagsHelper
  def parse_input_for(tweet: required)
    hashtags = hashtags_array(tweet.message)
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
    hashtags = hashtags_array(tweet.message)
    hashtags.each do |hashtag|
      if Hashtag.exists? keyword: hashtag
        hashtag = Hashtag.find_by keyword: hashtag
        ActionView::Base.send :include, Rails.application.routes.url_helpers
        tweet.message.gsub! hashtag.keyword, ActionController::Base.helpers.link_to(hashtag.keyword, Rails.application.routes.url_helpers.hashtag_path(hashtag))
      end
    end
  end

  private

  def hashtags_array(string)
    string.split.find_all{|word| /^#.+/.match word}.uniq
  end
end
