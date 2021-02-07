class Spot < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :genre_id, numericality: { other_than: 0 }
    validates :place_id, numericality: { other_than: 0 }
    validates :explanation
    validates :wifi_id, numericality: { other_than: 0 }
    validates :image
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :place
  belongs_to :wifi
end
