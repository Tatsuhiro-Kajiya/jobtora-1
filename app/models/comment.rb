class Comment < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :evaluation_id, numericality: { other_than: 0 }
    validates :review
  end

  belongs_to :user
  belongs_to :spot
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :evaluation
end
