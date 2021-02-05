class Spot < ApplicationRecord
  with_options presence: true
    validates :name
    validates :genre_id
    validates :place_id
    validates :explanation
    validates :wifi_id
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
