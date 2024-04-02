ActiveAdmin.register AboutPage do
    permit_params :content

    form do |f|
        f.inputs "About Page Details" do
          f.input :content, as: :text
        end
        f.actions
      end
  end