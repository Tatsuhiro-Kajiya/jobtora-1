class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    VALID_PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々+\z]/

    validates :nickname
    validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 20 }
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: "is invalid. Input Cannot be registered with a mixture of half-width alphanumeric characters " }
    with_options format: { with: VALID_NAME_REGEX, message: "is invalid. Input full-width characters." } do
      validates :last_name
      validates :first_name
    end
  end
  has_many :spots
  has_many :comments

  def self.guest
    find_or_create_by!(email: 'guest1234@gmail.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.nickname = 'ゲスト'
      user.last_name = 'ゲスト'
      user.first_name = 'ゲスト'
      user.age = 20
    end
  end
end
