class RenameCategoryColumnToBlogs < ActiveRecord::Migration[5.2]
  def change
  	rename_column :blogs, :Category, :category
  end
end
