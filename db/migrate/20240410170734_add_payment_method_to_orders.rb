class AddPaymentMethodToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :payment_method, :integer, default: 0
  end
end
