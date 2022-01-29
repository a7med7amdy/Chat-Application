class ChatsController < ApplicationController

    def create
        @app = App.find(params[:app_id])
        CreateChatJob.perform_later(@app)  #later means in back ground
        # @mx = @app.chats.maximum("chat_no")
        # if @mx
        #     @mx = @mx+1
        # else
        #     @mx = 1
        # end
        # @chat = @app.chats.new(chat_no: @mx)

        # if @chat.save
        #     redirect_to '/apps/'+@app.access_token
        # else
        #     render :new, status: :unprocessable_entity
        # end
    end

    def show
        @app = App.find_by(access_token: params[:app_id])
        @chat = @app.chats.find_by(chat_no: params[:id])
        @message = @chat.messages
    end
end
