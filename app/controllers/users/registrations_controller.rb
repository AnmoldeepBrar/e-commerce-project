# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]
  before_action :address_details, only: [:create]

  def new
    super
  end

  # def create
  #   super do |resource|
  #     session[:customer_id] = resource.id if resource&.id.present?
  #     puts params.inspect
  #   end
  # end

  def create
    super do |resource|
      resource.address = params[:customer][:address]
      resource.province_id = params[:customer][:province_id]
      session[:customer_id] = resource.id if resource&.id.present?
      puts params.inspect
    end
  end
  
  def address_details
    devise_parameter_sanitizer.permit(:sign_up, keys: [:address, :province_id])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:address, :province_id])
  end
end
