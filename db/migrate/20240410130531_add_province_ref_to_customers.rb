class AddProvinceRefToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_reference :customers, :province, foreign_key: true
  end
end
