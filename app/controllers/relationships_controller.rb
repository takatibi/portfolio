class RelationshipsController < ApplicationController

	def create
		@user = User.find(params[:follow_id])
		following = current_user.follow(@user)


	end

	def destroy
		@user = User.find(params[:follow_id])
		following = current_user.unfollow(@user)


	end

	def followings
		@user = User.find(params[:follow_id])
	end
end
