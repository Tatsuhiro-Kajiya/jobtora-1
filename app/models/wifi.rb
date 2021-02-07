class Wifi < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'wifi環境有り' },
    { id: 2, name: 'wifi環境無し' },
    { id: 3, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :spots
end