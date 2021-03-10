class Plot < ApplicationRecord
  belongs_to :user
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps
end
