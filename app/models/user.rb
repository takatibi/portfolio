class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :messeages, dependent: :destroy
  has_many :entries, dependent: :destroy

  attachment :profile_image

  validates :name, length: {in: 1..15}
  validates :introduction, length: {maximum: 100}
  validates :name, presence: true

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def followers?(other_user)
    self.followers.include?(other_user)
  end

  def current_following?(other_user)
    self.followings.exists?(other_user)
  end

  def current_followers?(other_user)
    self.followers.exists?
  end

  def self.search(search)
        return User.all unless search
        User.where(['name LIKE ?', "%#{search}%"])
  end
end



































