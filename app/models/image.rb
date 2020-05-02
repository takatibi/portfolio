class Image < ApplicationRecord
	belongs_to :blog, optional: true
	mount_base64_uploader :image, ImageUploader
	validates :image,presence: true
end
