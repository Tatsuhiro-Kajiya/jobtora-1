class Comment < ApplicationRecord
  validates :evaluation_id, presence: true, numericality: { other_than: 0 }

  belongs_to :user
  belongs_to :spot
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :evaluation
end
