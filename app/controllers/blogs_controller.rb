require 'base64'
class BlogsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :update]

		def new
			@blog = Blog.new
			@blog.images.new
		end

		def index
			# blank? = 空白か否か
			unless params[:category].blank?
				@blogs = Blog.where(category: params[:category]).page(params[:page]).reverse_order
				@category = params[:category]
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
			@new_comment = Comment.new

			_comments = Comment.includes(:user).where(blog_id: @blog.id).all.order(id: "DESC")
    		@comments = []
    		orderByReply(_comments, @comments)
		end

		def edit
			@blog = Blog.find(params[:id])
		end

		def ranks
			# 記事の番号(blog_id)が同じものにグループを分ける。order('count(blog_id) desc')番号の多い順に並び替える。:blog_idカラムのみを数字で取り出すように指定。
			@ranks = Blog.find(Favorite.group(:blog_id).order('count(blog_id) desc').limit(3).pluck(:blog_id))
		end



		def create
			@blog = Blog.new(blog_params)
			@blog.user_id = current_user.id
			# 画像のパラメーターの内容が[:blog][:image]
			if  params[:blog][:image]
				params[:blog][:image].each do |bi|
					# 「build」は親の子要素を保存する。
					@blog.images.build(image: Base64.decode64(bi))
				end
			else
				@blog.images.build()
			end

			begin
				if @blog.save
					flash[:notice] = "ブログを投稿しました"
					redirect_to blogs_path
				else
				 render action: :new
				end
			rescue => error
				logger.unknown("データベースが繋がってないかおかしいです。")
				logger.unknown(error.message)
				logger.unknown(error.backtrace)
			end
		end

		def update
			@blog = Blog.find(params[:id])

			if  params[:blog][:image]
				@blog.images.destroy_all
				params[:blog][:image].each do |bi|
					# 「build」は親の子要素を保存する。
				@blog.images.build(image: Base64.decode64(bi))
				end
			end

			begin
				if @blog.update(blog_params)
					flash[:notice] = "ブログ内容を編集しました"
					redirect_to blog_path(@blog)
				else
					render action: :edit
				end
			rescue => error
				logger.unknown("データベースが繋がってないかおかしいです。")
				logger.unknown(error.message)
				logger.unknown(error.backtrace)
			end
		end

		def destroy
			blog = Blog.find(params[:id])
			begin
				blog.destroy
			rescue => error
				logger.unknown("データベースが繋がってないかおかしいです。")
				logger.unknown(error.message)
				logger.unknown(error.backtrace)
			end
			redirect_to blogs_path
		end

	private

		def blog_params
			params.require(:blog).permit(:title, :body, :category, :map)
		end

		def orderByReply(comments ,newComments)
  			comments.each do |comment|
    			if comment.reply_comment == nil
     				__orderByReply(comment, comments, newComments)
    			end
  			end
		end

		def __orderByReply(parentComment, comments ,newComments)
  			newComments.push(parentComment)
  				comments.each do |comment|
   					if parentComment.id == comment.reply_comment
     				 	__orderByReply(comment, comments, newComments)
    				end
  				end
			end
		end































