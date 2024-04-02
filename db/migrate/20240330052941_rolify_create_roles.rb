class RolifyCreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:customers_roles, :id => false) do |t|
      t.references :customer
      t.references :role
    end
    
    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:customers_roles, [ :customer_id, :role_id ])
  end
end
