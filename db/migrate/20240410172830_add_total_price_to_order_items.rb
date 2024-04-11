class AddTotalPriceToOrderItems < ActiveRecord::Migration[7.1]
  def change
    add_column :order_items, :total_price, :decimal
  end
end
