ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  actions :index, :edit, :update, :destroy
  permit_params :total_amount, :status, :payment_method
  #
  # or
  #

  filter :total_amount
  filter :status
  filter :payment_method
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :total_amount
      f.input :status
      f.input :payment_method
    end
    f.actions
  end
end
