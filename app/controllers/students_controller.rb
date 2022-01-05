class StudentsController < ApplicationController
	before_action :logged_in_student, only: [:index, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	# before_action :admin_student, only: :destroy
	def show 
		@student = Student.find(params[:id])
	end

	def index
		@students = Student.all
		@students = Student.paginate(page: params[:page], per_page: 10)
	end

	def new
		@student = Student.new

	end

	def create
		@student = Student.new(s_params)
		if @student.save
			log_in @student
			flash[:success] = "student detail successfully created!!"
			redirect_to @student
		else
			render 'new'
		end
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])
		if @student.update(s_params)
			flash[:success] = "Profile updated!!"
			redirect_to @student
		else
			render 'edit'
		end
	end

	def destroy
		@student = Student.find_by(params[:id])
		@student.destroy
		flash[:success] = "User deleted"
		redirect_to students_url
	end

	private
	def s_params
		params.require(:student).permit(:name, :email, :password, :password_confirmation)
	end

	def logged_in_student
		unless logged_in?
			store_location
			flash[:danger] = "Please log in.."
			redirect_to signin_url
		end
	end

	def correct_user
		@student = Student.find(params[:id])
		redirect_to(root_url) unless current_student?(@student)
	end

	def admin_student
		redirect_to(root_url) unless current_student.admin?
	end
end
