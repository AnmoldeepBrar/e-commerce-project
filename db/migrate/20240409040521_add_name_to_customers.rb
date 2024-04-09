class AddNameToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :name, :string
  end
end
