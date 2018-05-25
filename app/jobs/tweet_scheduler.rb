class TweetScheduler < ApplicationJob
  # queue_as :default

  def perform(tweet)
    tweet.post_to_twitter
  end

end
