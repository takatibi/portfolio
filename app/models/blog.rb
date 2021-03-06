class Blog < ApplicationRecord
	belongs_to :user

	has_many :images, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy


	accepts_nested_attributes_for :images, allow_destroy: true
	validates :title, length: {in: 1..20}
	validates :body, length: {in: 1..200}
	validates :title, presence:true
	validates :body, presence:true
	validates :category, presence:true


	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

	# カテゴリーのEnum
	enum category: {
		アジア: 0,
		アフリカ: 1,
		ヨーロッパ: 2,
		北アメリカ: 3,
		南アメリカ: 4,
		オセアニア: 5,
		南極: 6,
		北極: 7,
	}

 	# 検索機能
    def self.search(method, word)
    	if method == "forward"
    		return Blog.where("title LIKE?","#{word}%")
    	elsif method == "backward"
    		return Blog.where("title LIKE?","%#{word}")
    	elsif method == "perfect"
    		return Blog.where(title: "#{word}")
    	elsif method == "partial"
    		return Blog.where("title LIKE?","%#{word}%")
    	else
    		return Blog.all
    	end
   	end






















end

































