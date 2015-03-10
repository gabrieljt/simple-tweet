class TweetsController < ApplicationController
  before_action :set_tweets

  def index
    @tweet = Tweet.new

    set_response
    respond_with @response
  end

  def create
    @tweet = Tweet.new tweet_params
    @tweet.user = User.create username: SecureRandom.uuid, password: '123456', password_confirmation: '123456' # TODO: get logged in user

    if @tweet.save
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
