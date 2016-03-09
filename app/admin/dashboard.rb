ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    section "Recent Products" do
      table_for Product.order("created_at desc").limit(5) do
        column :name do |product|
          link_to product.title, [:admin, product]
        end
        column :user
        column :created_at
      end
      strong { link_to "View All Products", admin_products_path }
    end
  end
end
