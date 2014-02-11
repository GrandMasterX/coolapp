class ApplicationController < ActionController::Base
  protect_from_forgery

	rescue_from OmniAuth::Strategies::OAuth2::CallbackError, :with =>
		:omniauth_callback_error_handler

	protected

	def omniauth_callback_error_handler
		redirect_to init_sign_in_users_path
	end
	
	def redirect_to_failure
	  message_key = env['omniauth.error.type']
	  new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{message_key}"
	  Rack::Response.new(["302 Moved"], 302, 'Location' => new_path).finish
	end
  
  private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
end