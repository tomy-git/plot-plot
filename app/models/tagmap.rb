class Tagmap < ApplicationRecord
  belongs_to :plot
  belongs_to :tag
  validates :plot_id, presence: true
  validates :tag_id, presence: true
end
