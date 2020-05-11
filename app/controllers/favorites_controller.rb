class FavoritesController < ApplicationController
	def create
		@blog = Blog.find(params[:blog_id])
		favorite = current_user.favorites.new(blog_id: @blog.id)
		begin
			favorite.save
		rescue => error
			logger.unknown("データベースが繋がってないかおかしいです")
			logger.unknown(error.message)
			logger.unknown(error.backtrace)
		end
	end

	def destroy
		@blog = Blog.find(params[:blog_id])
		favorite = current_user.favorites.find_by(blog_id: @blog.id)
		begin
			favorite.destroy
		rescue => error
			logger.unknown("データベースが繋がってないかおかしいです")
			logger.unknown(error.message)
			logger.unknown(error.backtrace)
		end
	end
end
