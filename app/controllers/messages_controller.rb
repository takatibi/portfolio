class MessagesController < ApplicationController
	before_action :authenticate_user!, :only => [:create]

	def create
		#Entry存在チョック
		unless Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
			redirect_back(fallback_location: root_path)
		end
		@message = Message.new(message_params)
		@message.user_id = current_user.id

		begin
			if @message.save
				flash[:success] = "メッセージを送りました"
				redirect_to "/rooms/#{@message.room_id}"
			else
				@room = Room.find(params[:message][:room_id])
				@entries = @room.entries
				@messages = @room.messages
				flash.now[:alert] = "文字を入力してください"
				render 'rooms/show'
			end
		rescue => error
			logger.unknown("データベースが繋がってないかおかしいです")
			logger.unknown(error.message)
			logger.unknown(error.backtrace)
		end
	end

	private
	def message_params
		params.require(:message).permit(:content, :room_id)
	end
end
