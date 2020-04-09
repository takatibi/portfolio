class UsersController < ApplicationController
  before_action :authenticate_user!



  def show
  	@user = User.find(params[:id])
    @blog = @user.blogs
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "名前を変更しました"
      redirect_to user_path(@user)
    else
      render action: :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name,:introduction,:profile_image)
  end
end

