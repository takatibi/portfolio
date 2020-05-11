class CommentsController < ApplicationController
	def create
		@blog = Blog.find(params[:blog_id])
		comment = current_user.comments.new(comment_params)
		comment.blog_id = @blog.id
		begin
			comment.save
		rescue => error
			logger.unknown("データベースが繋がってないかおかしいです")
			logger.unknown(error.message)
			logger.unknown(error.backtrace)
		end
	end

	def destroy
		comment = Comment.find(params[:blog_id])
		@blog = comment.blog
		begin
			comment.destroy
		rescue => error
			logger.unknown("データベースが繋がってないかおかしいです")
			logger.unknown(error.message)
			logger.unknown(error.backtrace)
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
