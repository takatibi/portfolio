class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :blog
	validates :comment, length: {maximum: 100}
end
