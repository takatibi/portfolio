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
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  attachment :profile_image

  validates :name, length: {in: 1..15}
  validates :introduction, length: {maximum: 100}
  validates :name, presence: true
  validates :age,length: { maximum: 2 }

  # フォロー機能
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

  # def self.search(search)
  #       return User.all unless search
  #       User.where(['name LIKE ?', "%#{search}%"])
  # end

    # 検索機能
    def self.search(method, word)
      if method == "forward"
        return User.where("name LIKE?","#{word}%")
      elsif method == "backward"
        return User.where("name LIKE?","%#{word}")
      elsif method == "perfect"
        return User.where(name: "#{word}")
      elsif method == "partial"
        return User.where("name LIKE?","%#{word}%")
      else
        return User.all
      end
    end

    # 通知機能
    def create_notification_follow!(current_user)
      temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
      if temp.blank?
        notification = current_user.active_notifications.new(
          visited_id: id,
          action: 'follow'
        )
        notification.save if notification.valid?
      end
    end




end



































