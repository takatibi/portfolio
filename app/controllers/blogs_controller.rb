class BlogsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :update]

	def new
		@blog = Blog.new
		@blog.images.new
	end

	def index
		@blogs = Blog.all
	end

	def show
		@blog = Blog.find(params[:id])
		@user = @blog.user
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def create
		blog = Blog.new(blog_params)
		blog.user_id = current_user.id
		# 画像のパラメーターの内容が[:blog][:image]
		params[:blog][:image].each do |bi|
			# 「build」は親の子要素を保存する。
			blog.images.build(image: bi)
		end
		blog.save
		redirect_to blogs_path
	end

	def update
		blog = Blog.find(params[:id])
		blog.update(blog_params)
		redirect_to blogs_path(blog)
	end

	def destroy
	blog = Blog.find(params[:id])
	blog.destroy
	redirect_to blogs_path
	end

	private
	def blog_params
		params.require(:blog).permit(:title, :body)
	end

end





		# <% if current_user == @blogs.user.id %>
		# <%= link_to "削除",blog_path(blog),method: :delete,"data-confirm" => "本当に削除しますか？",class:"btn btn-danger" %><br>
		# <% end %>


























