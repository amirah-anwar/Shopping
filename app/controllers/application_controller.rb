class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      dashboard_users_path
    elsif resource.is_a?(AdminUser)
      admin_dashboard_path
    end
  end
end
