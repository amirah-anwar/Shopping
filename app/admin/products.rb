ActiveAdmin.register Product do
  index do
    selectable_column
    column "Image" do |product|
      image_tag(product.attachment.url(:thumb))
    end
    column :title
    column :user
    column "Created At", :created_at
    column :price, sortable: :price do |product|
      div class: "price" do
        number_to_currency product.price
      end
    end
    default_actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :attachment do
        image_tag product.attachment.url(:medium)
      end
      row :description
      row :price, :price do |product|
        number_to_currency product.price
      end
      row :created_at
      row :updated_at
      row :user
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :attachment, as: :file
      f.input :description
      f.input :price
      f.input :user
      f.actions
    end
  end
end
