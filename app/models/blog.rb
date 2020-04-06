class Blog < ApplicationRecord
	belongs_to :user
	has_many :images, dependent: :destroy
	accepts_nested_attributes_for :images, allow_destroy: true
	validates :title, length: {in: 1..20}
	validates :body, length: {in: 1..200}

end
