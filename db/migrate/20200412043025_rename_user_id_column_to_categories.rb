class RenameUserIdColumnToCategories < ActiveRecord::Migration[5.2]
  def change
  	rename_column :categories, :user_id, :blog_id
  end
end
