class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected

  def current_user
    @current_user ||= User.find_by_access_token params[:access_token]
  end

  def restrict_access
    unless current_user.present?
      @errors = ["authentication failed"]
      respond_with @errors, status: 401
    end
  end
end
