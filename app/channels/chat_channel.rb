class ChatChannel < ApplicationCable::Channel
  def subscribed
    print(params)
    stream_from "chat_channel_#{params[:chat_id]}"
  end

#   def speak(data)
#     Message.create! text: data['message'], room_id: data['roomId']
#  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
