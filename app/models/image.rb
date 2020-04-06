class Image < ApplicationRecord
	belongs_to :blog, optional: true
	mount_uploader :image, ImageUploader
end
