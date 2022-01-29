class CreateMessageJob < ApplicationJob
  queue_as :default

  def perform(chat,message_params)
    # Do something later
        @mx = chat.messages.maximum("message_no")
        if @mx
            @mx = @mx+1
        else
            @mx = 1
        end
        @message = chat.messages.new(message_no: @mx, body: message_params["body"])

        if @message.save
            #redirect_to chat
            html = ApplicationController.render(
              partial: 'messages/message',
              locals: { message: @message }
            )
            ActionCable.server.broadcast "chat_channel_#{chat.chat_no}" , {html: html}
        else
            render :new, status: :unprocessable_entity
        end
  end
end
