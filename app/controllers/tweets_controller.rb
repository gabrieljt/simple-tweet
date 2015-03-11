class TweetsController < ApplicationController
  include HashtagsHelper
  before_action :set_tweets

  def index
    @tweet = Tweet.new
    @tweets.each do |tweet| parse_output_for tweet: tweet end

    set_response
    respond_with @response
  end

  def create
    @tweet = Tweet.new tweet_params
    @tweet.user = current_user

    if @tweet.save
      parse_input_for tweet: @tweet
      set_response
      respond_with @response, location: tweets_path
    else
      render :index
    end
  end

  private

  def set_tweets
    @tweets = Tweet.all
  end

  def set_response
    @response = { tweet: @tweet, tweets: @tweets }
  end

  def tweet_params
    params.require(:tweet).permit(:message)
  end
end
