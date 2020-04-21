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
		end

		def show
			@blog = Blog.find(params[:id])
			@user = @blog.user
			@comment = Comment.new

			if @blog.map?
			# Geocoderで対象の場所の検索。
			results = Geocoder.search(@blog.map)
			# first.coordinatesは検索結果の最初の緯度軽度を表す
			@latlng = results.first.coordinates
			end
		end

		def edit
			@blog = Blog.find(params[:id])
		end



		def create
			@blog = Blog.new(blog_params)
			@blog.user_id = current_user.id
			# 画像のパラメーターの内容が[:blog][:image]
			if  params[:blog][:image]
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
			@blog = Blog.find(params[:id])

			if  params[:blog][:image]
				@blog.images.destroy_all
				params[:blog][:image].each do |bi|
					# 「build」は親の子要素を保存する。
				@blog.images.build(image: bi)
				end
			end

			if @blog.update(blog_params)
				flash[:notice] = "ブログ内容を編集しました"
				redirect_to blog_path(@blog)
			else
				render action: :edit
			end
		end

		def destroy
		blog = Blog.find(params[:id])
		blog.destroy
		redirect_to blogs_path
		end

	private

		def blog_params
			params.require(:blog).permit(:title, :body, :category, :map)
		end

end































