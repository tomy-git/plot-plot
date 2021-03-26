class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :plot
  validates :content, presence: true
end
