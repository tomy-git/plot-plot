class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :plot

  # バリデーション
  # コメントは1～140文字まで、空はダメ
  validates :content, presence: true, length: { minimum: 1, maximum: 140 }
end
