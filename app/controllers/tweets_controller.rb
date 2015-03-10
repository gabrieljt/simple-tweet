class TweetsController < ApplicationController
  before_action :set_tweets

  def index
    @tweet = Tweet.new

    set_response
    respond_with @response
  end

  def create
    @tweet = Tweet.new tweet_params

    if @tweet.save
      set_response
      respond_with(@response, location: tweets_path)
    else
      render 'index'
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
    params.require(:tweet).permit(:user_id, :content)
  end
end
