require 'rails_helper'

RSpec.describe App, type: :model do

  it 'has a name' do #validates not empty
    app = App.new(name: '')
    expect(app).to_not be_valid

    app.name='friends' #validates name right
    expect(app).to be_valid

    app.save

    app = App.new(name: 'friends') #validates uniqueness
    expect(app).to_not be_valid

  end

  it 'has a chats_count' do
    app = App.new(name: 'friends')
    chats_count = app.chats_count #check that no chats at beggining
    expect(chats_count).to eq(nil)

    app.save #check number of chats in app
    chat = app.chats.new(chat_no: 1)
    chat.save
    chats_count = app.chats_count
    expect(chats_count).to eq(1)

    expect(chats_count).to_not eq(2)
  end

end
