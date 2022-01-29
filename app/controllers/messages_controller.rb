class MessagesController < ApplicationController
    def index
      @q = params.fetch(:search_query)
    if(@q)
      @app = App.find_by(access_token: params[:app_id])
      @chat = @app.chats.find_by(chat_no: params[:chat_id])
      @ret = @chat.messages
      @messages_match = @ret.search(@q , fields: ['body'], where: {chat_id: @chat.id})
    else
      @messages_match = "No results"
    end
  end
  
  
      def create
          @chat = Chat.find(params[:chat_id])
          CreateMessageJob.perform_later(@chat,message_params)  #later means in back ground
      end
  
      private
      def message_params
        params.require(:message).permit(:body)
      end
  
  end
  