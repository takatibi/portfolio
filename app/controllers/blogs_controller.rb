class BlogsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :update]

		def new
			@blog = Blog.new
			@blog.images.new
		end

		def index
			unless params[:category].blank?
				@blogs = Blog.where(category: params[:category]).page(params[:page]).reverse_order
			else
				@blogs = Blog.page(params[:page]).reverse_order
			end
			@categories = Blog.categories
			@category = params[:category]
		end

		def show
			@blog = Blog.find(params[:id])
			@user = @blog.user
			@comment = Comment.new
		end

		def edit
			@blog = Blog.find(params[:id])
		end

		def create
			@blog = Blog.new(blog_params)
			@blog.user_id = current_user.id
			# 画像のパラメーターの内容が[:blog][:image]
			if params[:blog][:image]
				params[:blog][:image].each do |bi|
					# 「build」は親の子要素を保存する。
					@blog.images.build(image: bi)
				end
			else
				@blog.images.build()
			end

			if @blog.save
				flash[:notice] = "ブログを投稿しました"
				redirect_to blogs_path
			else
			 render action: :new
			end
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
			params.require(:blog).permit(:title, :body ,:category)
		end

end































