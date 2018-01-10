class AddTopicRefToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :topic, foreign_key: true
  end
end
