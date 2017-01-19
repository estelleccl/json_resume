module ApplicationHelper

	def is_json?(file)
		File.extname(file) == ".json"
	end

end