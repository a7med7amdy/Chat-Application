require 'rails_helper'

RSpec.describe "Chats", type: :request do
  let(:valid_attributes) do
    {
      name:   'Work',
    }
  end

  let(:invalid_attributes) do
    {
      name:   ''
    }
  end


    describe "GET /show" do
      it "renders a success response" do
        app= App.create! valid_attributes
        app.save
        chat = app.chats.create(chat_no: 1)
        get "/apps/#{app.access_token}/chats/#{chat.chat_no}"
        expect(response).to be_successful
      end
    end


    # the output will be empty content as it goes into queues first to be served and also in thr creation of message
    
    
    # describe "POST /create" do
    #   context 'with valid parameters' do
    #     it "redirects to the created app" do
    #       app= App.new(name: "school")
    #       app.save
    #       post "/apps/#{app.id}/chats"
    #       expect(response).to eq("")
    #     end
    #   end
    # end

end
