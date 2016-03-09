ActiveAdmin.register User do
  index do
    selectable_column
    column "Image" do |user|
      image_tag(user.avatar.url(:thumb))
    end
    column "First Name", :fname
    column "Last Name", :lname
    column "Created At", :created_at
    column "Postal Address", :postal
    column "Email Address", :email
    default_actions
  end

  show do
    attributes_table do
      row :avatar do
        image_tag user.avatar.url(:medium)
      end
      row :id
      row 'First Name' do
        user.fname
      end
      row 'Nast Name' do
        user.lname
      end
      row :created_at
      row 'Postal Address' do
        user.postal
      end
      row 'Email Address' do
        user.email
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :fname, label: "First Name"
      f.input :lname, label: "Last Name"
      f.input :avatar, as: :file
      f.input :postal, label: "Postal Address"
      f.input :email, label: "Email Address"
      f.actions
    end
  end
end
