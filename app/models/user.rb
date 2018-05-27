class User < ApplicationRecord
  has_many :tweets

  def self.find_or_create_from_omniauth(auth)
    if user = User.find_by(uid: auth['uid'])
      user
    else
      user = User.create(
        name: auth.info.nickname,
        uid: auth.uid,
        profile_url: auth.info.urls[:Twitter],
        token: auth.credentials.token,
        secret: auth.credentials.secret
      )
    end
  end

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = self.token
      config.access_token_secret = self.secret
    end
  end
end
