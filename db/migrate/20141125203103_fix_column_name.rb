class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :line_items, :quantitiy, :quantity
  end
end
