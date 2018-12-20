class RegistrationsController < Devise::RegistrationsController

  protected

    def update_resource(resource, params)
      if params[:current_password].blank? && params[:password].blank? && params[:password_confirmation].blank?
        resource.update_without_password(params)
      else
       super
      end
    end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :date_of_birth, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :current_password, :password, :password_confirmation, :date_of_birth, :avatar)
  end
end