# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]
  
  # before_action :configure_account_update_params, only: [:update]

# GET /resource/sign_up
def new
  super do |resource|
    resource.build_image_attachment unless resource.image.attached? 
  end
end

# POST /resource
def create
  puts "Current User: #{current_user.inspect}"
  if current_user&.admin? # Verifica si el usuario actual es Esteban (si ya está logueado y tiene el atributo admin en true)
    build_resource(sign_up_params)
    resource.save
    flash[:notice] = "Usuario creado correctamente."
  else
    puts @user.errors.full_messages
  end
end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, images_attributes: [:url, :context])
  end
  def check_admin
    @is_admin = current_user&.admin?
  end
  # Redirigir siempre a la página principal después de crear un usuario
  def after_sign_up_path_for(resource)
    root_path
  end

  # Sobrescribimos el método sign_up para evitar que se inicie sesión automáticamente
  def sign_up(resource_name, resource)
    build_resource(sign_up_params)
    resource.save
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
