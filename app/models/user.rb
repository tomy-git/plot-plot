class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :icon
  has_many :plots, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_plots, through: :likes, source: :plot

  # def already_liked?(plot)
  #   self.likes.exists?(plot_id: plot.id)
  # end

  # follower/followedはまた後で書くこと

end
