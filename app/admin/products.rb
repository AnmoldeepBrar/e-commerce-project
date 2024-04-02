ActiveAdmin.register Product do
  permit_params :name, :description, :price, :on_sale, :image, category_ids: []

  #filter :avatar_cont, label: 'Avatar'
  #filter :image_attachment_id_eq, label: 'Image Attachment ID'

  #remove_filter 'avatar_attachment'
  #remove_filter 'avatar_blob'
  filter :on_sale, label: 'On Sale'

    index do
      selectable_column
      id_column
      column :name
      column :description
      column :price
      column :on_sale
      column :image do |product|
        if product.image.present?
          image_tag product.image.url(:thumb)
        else
          'EMPTY'
        end
      end
      # column "Image" do |product|
      #   image_tag product.image.url, class: 'admin-table-image' if product.image.present?
      # end
      actions
    end
  
    form do |f|
      f.inputs "Product Details" do
        f.input :name
        f.input :description
        f.input :price
        f.input :category_id, as: :select, collection: Category.pluck(:name, :id)
        f.input :on_sale, as: :boolean
        f.input :image, as: :file
      end
      f.actions
    end

    #Formtastic::FormBuilder.perform_browser_validations = true

  end