require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'has a body' do #validates not empty
    app = App.new(name: 'friends')
    app.save
    chat = app.chats.new(chat_no: 1)
    chat.save
    message = chat.messages.new(body: '')

    expect(message).to_not be_valid

    message.body='hiii' #validates name right
    expect(message).to be_valid

    expect(message.body).to eq('hiii')
  end
end
