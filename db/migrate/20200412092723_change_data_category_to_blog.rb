class ChangeDataCategoryToBlog < ActiveRecord::Migration[5.2]
  def change
  	change_column :blogs, :category, :integer, null: :false
  end
end
