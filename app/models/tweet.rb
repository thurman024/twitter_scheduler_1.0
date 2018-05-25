class Tweet < ApplicationRecord
  belongs_to :user

  def post_to_twitter
    user.twitter.update(self.content)
  end
end
