class StudentsController < ApplicationController
	def new
		respond_to do |format|
	      format.html { render 'static_pages/home' }
	      format.js
	    end
	end
end
