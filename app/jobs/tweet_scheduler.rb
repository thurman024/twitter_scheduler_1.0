class TweetScheduler < ApplicationJob

  def schedule(tweet)
    tweet.user.twitter.update(tweet.content)
  end

end
