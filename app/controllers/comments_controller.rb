class CommentsController < ApplicationController
	def create
		@blog = Blog.find(params[:blog_id])
		comment = current_user.comments.new(comment_params)
		comment.blog_id = @blog.id
		comment.save
	end

	def destroy
		comment = Comment.find(params[:blog_id])
		@blog = comment.blog
		comment.destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
