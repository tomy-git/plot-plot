class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :plots, through: :tagmaps

  # バリデーション
  # tag_nameは1～20文字、空はダメ
  validates :tag_name, presence: true, length: { minimum: 1,  maximum: 20 }
end
