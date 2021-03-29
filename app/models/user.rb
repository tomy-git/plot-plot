class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :icon
  has_many :plots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_plots, through: :likes, source: :plot
  has_many :comments, dependent: :destroy

  # follower/followed
  has_many :followed_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followed, through: :followed_relationships
  has_many :follower_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :follower_relationships

  # バリデーション
  # nameは1～20文字までで同一・空はダメ
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 20 }
  # introduction200文字まで
  validates :introduction, length: { maximum: 200 }

  def active_for_authentication?
    super && (self.is_deleted == false )
  end

  def followed?(user)
    followed_relationships.find_by(followed_id: user.id)
  end

  def follow(user)
    followed_relationships.create!(followed_id: user.id)
  end

  def unfollow(user)
    followed_relationships.find_by(followed_id: user.id).destroy
  end
end
