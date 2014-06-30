class RegistrationController < Devise::RegistrationsController
	def new
        @user= User.new
    end
 
    def create
 
        @user = User.new
        @user.username = params[:user][:username]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation =params[:user][:password_confirmation]
        yield resource if block_given?
        if resource.save
            if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_flashing_format?
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
             else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
            end
        else
        clean_up_passwords resource
        respond_with resource
        end
    end

end
