class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_order, :ordered_products_count

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      dashboard_users_path
    elsif resource.is_a?(AdminUser)
      admin_dashboard_path
    end
  end

  def current_order
    return unless current_user
    order = current_user.orders.pending_status.last
    order = current_user.orders.create if order.blank?
    order
  end

  def ordered_products_count
    current_order.ordered_products.count.to_i
  end
end
