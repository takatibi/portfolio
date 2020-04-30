class Blog < ApplicationRecord
	belongs_to :user

	has_many :images, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	accepts_nested_attributes_for :images, allow_destroy: true
	validates :title, length: {in: 1..20}
	validates :body, length: {in: 1..200}
	validates :title, presence:true
	validates :body, presence:true
	validates :category, presence:true

	enum category: {
		アジア: 0,
		アフリカ: 1,
		ヨーロッパ: 2,
		北アメリカ: 3,
		南アメリカ: 4,
		オセアニア: 5,
		南極: 6,
	}

	def self.search(search)
      return Blog.all unless search
      Blog.where([ "(title like ?)","%#{search}%"])
    end
end
