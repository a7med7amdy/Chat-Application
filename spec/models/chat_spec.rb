require 'rails_helper'

RSpec.describe Chat, type: :model do
  it 'has a messages_count' do
    app = App.new(name: 'friends')
    app.save
    chat = app.chats.new(chat_no: 1)
    chat.save

    expect(chat.chat_no).to eq(1) #check for the chat number

    messages_count = chat.messages_count #check that no messages at beggining
    expect(messages_count).to eq(nil)

    message = chat.messages.new(body: 'hi') #check for number of messages
    message.save
    
    messages_count = chat.messages_count
    expect(messages_count).to eq(1)

    expect(messages_count).to_not eq(3)
  end
end
