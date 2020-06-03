class AddTaxToItemes < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :tax, :float, default: 1.1
  end
end
