class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image

  validates :name, length: {in: 1..15}
  validates :introduction, length: {maximum: 100}
  validates :name, presence: true

  def self.search(search)
        return User.all unless search
        User.where(['name LIKE ?', "%#{search}%"])
  end
end
