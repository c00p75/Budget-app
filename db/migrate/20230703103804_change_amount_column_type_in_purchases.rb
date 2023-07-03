class ChangeAmountColumnTypeInPurchases < ActiveRecord::Migration[7.0]
  def change
    change_column :purchases, :amount, :decimal
  end
end
