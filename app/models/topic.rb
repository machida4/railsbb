class Topic < ApplicationRecord
  has_many :posts
  has_many :user, through: :posts
end
