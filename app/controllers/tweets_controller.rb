class TweetsController < ApplicationController
  before_action :signed_in?

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      #scheduled with Job
      TweetScheduler.set(wait_until: @tweet.time).perform_later(@tweet)
      #test to post tweet now
      #@tweet.post_to_twitter
      redirect_to tweets_path
    else
      render 'new'
    end
  end

  def index
    @tweets = current_user.tweets
  end


  private
  def tweet_params
    params.require(:tweet).permit(:content, :time)
  end
end
