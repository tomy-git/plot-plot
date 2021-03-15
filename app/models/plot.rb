class Plot < ApplicationRecord
  belongs_to :user
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  # タグの作成・更新に使用します
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name)unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.plot_tags.delete PlotTag.find_by(tag_name: old)
    end
    new_tags.each do |new|
      new_plot_tag = Tag.find_or_create_by(tag_name: new)
      # tagmap = Tag.find_or_create_by(name: new)
      # self.plot.tags << new_plot_tag
      self.tags << new_plot_tag
    end
  end
  
  def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
