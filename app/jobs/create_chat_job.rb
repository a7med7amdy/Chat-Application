class CreateChatJob < ApplicationJob
  queue_as :default

  def perform(app)
    # Do something later
        @mx = app.chats.maximum("chat_no")
        if @mx
            @mx = @mx+1
        else
            @mx = 1
        end
        @chat = app.chats.new(chat_no: @mx)

        if @chat.save
            #redirect_to '/apps/'+@app.access_token

            html = ApplicationController.render(
              partial: 'chats/chat',
              locals: { chat: @chat, access_token: app.access_token}
            )
            ActionCable.server.broadcast "createchat_channel_#{app.access_token}" , {html: html}

        else
            render :new, status: :unprocessable_entity
        end

  end

end
