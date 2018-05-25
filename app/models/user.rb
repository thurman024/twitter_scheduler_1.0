class User < ApplicationRecord

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
end
