class Blog::Topic < ApplicationRecord
  has_many :posts
end
