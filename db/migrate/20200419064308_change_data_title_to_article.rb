class ChangeDataTitleToArticle < ActiveRecord::Migration[5.2]
  def change
  	change_column :blogs, :map, :string
  end
end
