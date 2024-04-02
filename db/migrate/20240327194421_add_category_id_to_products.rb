class AddCategoryIdToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :category, null: false, foreign_key: true, default: 1
  end
end
