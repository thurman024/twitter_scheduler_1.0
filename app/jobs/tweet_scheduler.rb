class TweetScheduler < ApplicationJob
  
  def perform(tweet)
    tweet.post_to_twitter
  end

end
