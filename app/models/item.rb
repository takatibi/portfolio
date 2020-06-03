class Item < ApplicationRecord
	attachment :item_image

	validates :product, presence:true
	validates :explanation, presence:true
	validates :price, numericality: true
	validates :item_image, presence:true
end
