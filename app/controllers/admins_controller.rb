class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = "Admin created successfully"
      redirect_to login_admins_path
    else
      flash.now[:alert] = "Error creating admin: " + @admin.errors.full_messages.join(", ")
      render :new
    end
  end

  def login_form
    render :login
  end

  def login
    @admin = Admin.find_by(username: params[:username])
    if @admin && @admin.authenticate(params[:password])
      flash[:notice] = "You have successfully logged in as admin."
      logger.info("Login successful") # Check console output
      redirect_to new_admin_path
    else
      flash.now[:alert] = "Invalid username or password."
      logger.info("Login failed") # Check console output
      render :login
    end
  end
  
  private

  def admin_params
    params.require(:admin).permit(:username, :password, :password_confirmation)
  end
end
