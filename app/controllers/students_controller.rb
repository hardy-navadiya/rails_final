class StudentsController < ApplicationController
	def show 
		@student = Student.find(params[:id])
	end

	def new
		@student = Student.new

	end

	def create
		@student = Student.new(s_params)
		if @student.save
			flash[:success] = "student detail successfully created!!"
			redirect_to @student
		else
			render 'new'
		end
	end

	private
	def s_params
		params.require(:student).permit(:name, :email, :password, :password_confirmation)
	end
end
