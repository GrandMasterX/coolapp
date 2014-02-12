class ApplicationController < ActionController::Base
  protect_from_forgery

	rescue_from OmniAuth::Strategies::OAuth2::CallbackError, :with =>
		:omniauth_callback_error_handler
		
	def after_sign_in_path_for(resource_or_scope)
	   if request.env['omniauth.origin']
	      request.env['omniauth.origin']
	    end
	end

	protected

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