class AddOnSaleAndNewToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :on_sale, :boolean
    add_column :products, :new, :boolean
  end
end
