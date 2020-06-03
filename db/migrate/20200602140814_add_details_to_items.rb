class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :product, :string
    add_column :items, :explanation, :text
    add_column :items, :price, :integer
    add_column :items, :item_image_id, :string
  end
end
