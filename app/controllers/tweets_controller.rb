class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    redirect_to tweets_path
  end

  def index
    @tweets = Tweet.all
  end


  private
  def tweet_params
    params.require(:tweet).permit(:content, :time)
  end
end
