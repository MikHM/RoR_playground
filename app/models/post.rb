class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments

  validates :title, presence: true, length: { minimum: 5}
end
