class CommentsController < ApplicationController
	def create
		blog = Blog.find(params[:blog_id])
		comment = current_user.comments.new(comment_params)
		comment.blog_id = blog.id
		comment.save
		redirect_to blog_path(blog)
	end

	def destroy
		comment = Comment.find(params[:blog_id])
		blog = comment.blog
		comment.destroy
		redirect_to blog_path(blog)
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
