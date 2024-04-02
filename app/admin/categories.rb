ActiveAdmin.register Category do
    permit_params :name, :description  # Add any other attributes you want to permit here
  
    index do
      selectable_column
      id_column
      column :name
      column :description
      actions
    end
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :description
      end
      f.actions
    end
  end