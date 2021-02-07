class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'ホテル' },
    { id: 2, name: 'ビジネスホテル' },
    { id: 3, name: '旅館' },
    { id: 4, name: '民宿' },
    { id: 5, name: 'コワーキングスペース' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :spots
end