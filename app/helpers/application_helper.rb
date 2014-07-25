module ApplicationHelper

	# Returns the full title on a per-page basis.
	def site_title
		site_name = "storythin.gs"
	end

	# Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = site_title
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	# Returns the page title on a per-page basis.
	def view_title(page_title)
		page_title
	end
end