module SessionsHelper

	# stores user id into temp session 
	def log_in (user)
		session[:user_id] = user.id
	end

	# finds the user by user_id of the session
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	# checks if there is a user_id in the session 
	def logged_in?
		!current_user.nil?
	end

	# sets the id of the user in the session to nil
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

end
