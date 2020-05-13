class SearchController < ApplicationController
	def search
		if params[:search_model] == "user"
			# @users = User.search(params[:seach_content])
			@users = User.search(params[:search_method],params[:seach_content])
			@seach = params[:seach_content]
		elsif params[:search_model] == "blog"
			# @blogs = Blog.search(params[:seach_content])
			@blogs = Blog.search(params[:search_method],params[:seach_content])
			@seach = params[:seach_content]
		end
	end
end
