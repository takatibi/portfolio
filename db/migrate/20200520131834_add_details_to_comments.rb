class AddDetailsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :reply_comment, :integer
  end
end
