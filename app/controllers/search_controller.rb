class SearchController < ApplicationController
	def search
		if params[:search_model] == "user"
			@users = User.search(params[:seach_content])
			@seach = params[:seach_content]
		elsif params[:search_model] == "blog"
			@blogs = Blog.search(params[:seach_content])
			@seach = params[:seach_content]
		end
	end
end
