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
		Asia: 0,
		Africa: 1,
		Europa: 2,
		North_america: 3,
		South_america: 4,
		Oceania: 5,
	}

	def self.search(search)
      return Blog.all unless search
      Blog.where([ "(title like ?)","%#{search}%"])
    end
end
