class AddStatusToTweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :status, :string, default: "scheduled"
  end
end
