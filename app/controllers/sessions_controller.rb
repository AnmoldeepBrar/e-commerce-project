# app/controllers/sessions_controller.rb
class SessionsController < Devise::SessionsController
  def create
    user = Customer.find_for_authentication(email: params[:customer][:email])

    if user && user.valid_password?(params[:customer][:password])
      sign_in(:customer, user)
      redirect_to after_sign_in_path_for(user)
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    sign_out(:customer)
    redirect_to root_path
  end

  private

  def after_sign_in_path_for(resource)
    if resource.has_role?(:admin)
      new_admin_user_session_path
    else
      products_path
    end
  end
end
