class ApplicationController < ActionController::Base
    include Devise::Controllers::Helpers
    helper_method :current_user
    helper_method :cart
    def current_user
      @current_user ||= Customer.find(session[:customer_id]) if session[:customer_id]
    end
  
    private
  
    def require_login
      unless current_user
        flash[:danger] = "You must be logged in to access this."
        redirect_to new_customer_session_path
      end
    end
  
    def cart
      @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
    end
  
    def update_cart(new_cart)
      cookies[:cart] = {
        value: JSON.generate(new_cart),
        expires: 2.days.from_now
      }
      cookies[:cart]
    end
  
end
