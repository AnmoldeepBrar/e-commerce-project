class RemoveProvinceFromCustomers < ActiveRecord::Migration[7.1]
  def change
    remove_column :customers, :province, :string
  end
end
