module SessionsHelper
	def log_in(student)
		session[:student_id] = student.id
	end

	def current_student
		@current_student ||= Student.find_by(id: session[:student_id])
	end

	def logged_in?
		!current_student.nil?
	end

	def log_out
		session.delete(:student_id)
		@current_student = nil
	end

	def current_student?(student)
		student == current_student
	end

	# redirect to stored location 
	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url) 
	end

	# stored url which will trying to be accessed 
	def store_location
		session[:forwarding_url] = request.url if request.get?
	end
end
