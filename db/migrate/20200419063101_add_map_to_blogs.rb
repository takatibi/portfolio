class AddMapToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :map, :integer
  end
end
