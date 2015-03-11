class HashtagsController < ApplicationController
  include HashtagsHelper
  before_action :set_response

  def show
    @hashtag = Hashtag.find params[:id]
    @hashtag_tweets = @hashtag.tweets

    @hashtag_tweets.each do |tweet| parse_output_for tweet: tweet end

    respond_with @response
  end

  private

  def set_response
    @response = { hashtag: @hashtag, hashtag_tweets: @hashtag_tweets }
  end
end
