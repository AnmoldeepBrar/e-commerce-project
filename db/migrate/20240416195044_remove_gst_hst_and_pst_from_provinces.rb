class RemoveGstHstAndPstFromProvinces < ActiveRecord::Migration[7.1]
  def change
    remove_column :provinces, :gst_hst, :decimal
    remove_column :provinces, :pst, :decimal
  end
end
