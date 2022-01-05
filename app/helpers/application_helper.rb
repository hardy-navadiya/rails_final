module ApplicationHelper
	def full_title(page_title = '')
		main_title = "Final rails project"
		if page_title.empty?
			main_title
		else
			page_title
		end
	end
end
