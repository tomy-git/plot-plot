class Plot < ApplicationRecord
  belongs_to :user
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  # タグの作成・更新に使用します
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name)unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    # 古いタグの削除
    old_tags.each do |old|
      self.tags.delete tags.find_by(tag_name: old)
    end

    # 新しいタグの生成
    new_tags.each do |new|
      new_plot_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_plot_tag
    end
  end

  # すでにlikeしたかどうかの判定（like unlikeの切り替え）
  def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
