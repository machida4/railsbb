class Topic < ApplicationRecord
  has_many :posts
  has_many :user, through: :posts

  before_save :set_default_title

  private

    def set_default_title
      if self.title.blank?
        self.title = 'No title'
      end
    end
end
