class AddProvinceToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :province, :string
  end
end
