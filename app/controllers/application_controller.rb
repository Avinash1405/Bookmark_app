class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   #before_action LoginFilter
end
 
# class LoginFilter
#   def self.before(controller)
#     unless user_signed_in?
#       controller.flash[:error] = "You must be logged in to access this section"
#       redirect_to root_path
#     end
#   end
# end
