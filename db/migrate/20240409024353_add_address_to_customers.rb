class AddAddressToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :address, :string
  end
end
