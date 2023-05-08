class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :stocks, :ticker, :stock
    rename_column :stocks, :name, :sector
  end
end
