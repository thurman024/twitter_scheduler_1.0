class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    #scheduled with Job
    #TweetScheduler.set(wait_until: @tweet.time).schedule(@tweet)
    #test to post tweet now
    @tweet.user.twitter.update(@tweet.content)
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
