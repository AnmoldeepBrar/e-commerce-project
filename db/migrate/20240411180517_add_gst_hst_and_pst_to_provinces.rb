class AddGstHstAndPstToProvinces < ActiveRecord::Migration[7.1]
  def change
    add_column :provinces, :gst_hst, :decimal
    add_column :provinces, :pst, :decimal
  end
end
