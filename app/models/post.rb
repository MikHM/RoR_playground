class Post < ApplicationRecord
  enum status: { draft: 0, published: 1}

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments

  validates :title, presence: true, length: { minimum: 5}
end
