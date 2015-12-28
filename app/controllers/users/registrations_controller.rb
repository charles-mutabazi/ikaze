class Users::RegistrationsController < Devise::RegistrationsController

  # clear_respond_to
  respond_to :html, :js

  #this controller is to override devise preset settings
  private
  # Overwrite update_resource to let users to update their user without giving their password
  def update_resource(resource, params)
    if !current_user.provider.nil?
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :avatar, :gender, :password, :password_confirmation, :current_password)
  end

end
