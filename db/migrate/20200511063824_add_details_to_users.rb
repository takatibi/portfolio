class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sex, :boolean
  end
end
