class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: {maximum: 280}

  def post_to_twitter
    user.twitter.update(self.content)
    self.update(status: "posted")
  end
end
