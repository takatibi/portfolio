class AddCategoryToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :Category, :integer, :null => false
  end
end
