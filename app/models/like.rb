class Like < ApplicationRecord
  belongs_to :user
  belongs_to :plot
  validates_uniqueness_of :plot_id, scope: :user_id
end
