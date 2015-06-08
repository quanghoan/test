class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  private
  def admin_permission
    unless current_user.is_admin?
      flash[:alert] = 'You must be Admin'
      redirect_to root_url
    end
  end

  def examiner_permission
    unless current_user.is_examiner?
      flash[:alert] = 'You must be examiner'
      redirect_to root_url
    end
  end
end
