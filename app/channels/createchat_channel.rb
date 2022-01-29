class CreatechatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    print(params)
    stream_from "createchat_channel_#{params[:app_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
