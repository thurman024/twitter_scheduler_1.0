class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    #scheduled with Job
    TweetScheduler.set(wait_until: @tweet.time).perform_later(@tweet)
    print Time.current
    #test to post tweet now
    #@tweet.post_to_twitter
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
