class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @blog = @user.blogs
    # roomボタンの出力判定処理
    # ログインしているUserと相手のUserのidを取得
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id != current_user.id
      # ...自分自身以外の場合
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if !@isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
  end

  def follower
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])

    begin
    	if @user.update(user_params)
        flash[:notice] = "ユーザー情報を変更しました"
        redirect_to user_path(@user)
      else
        render action: :edit
      end
    rescue => error
      logger.unknown("データベースが繋がってないかおかしいです。")
      logger.unknown(error.message)
      logger.unknown(error.backtrace)
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image, :sex, :age)
  end
end































