class RenameBidyColumnToBlogs < ActiveRecord::Migration[5.2]
  def change
  	rename_column :blogs, :bidy, :body
  end
end
