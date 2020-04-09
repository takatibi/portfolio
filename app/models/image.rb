class Image < ApplicationRecord
	belongs_to :blog, optional: true
	mount_uploader :image, ImageUploader
	validates :image,presence: true
end
