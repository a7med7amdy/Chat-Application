require 'rails_helper'

RSpec.describe "Apps", type: :request do

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

    describe "GET /index" do
      it "returns a success response" do
        App.create! valid_attributes
        get '/apps/index'
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a success response" do
        app= App.create! valid_attributes
        get "/apps/#{app.access_token}"
        expect(response).to be_successful
      end
    end

    describe "GET /new" do
      it "renders a success response" do
        get "/apps/new"
        expect(response).to be_successful
      end
    end

    describe "GET /edit" do
      it "renders a success response" do
        app = App.new(valid_attributes)
        app.save
        get "/apps/#{app.access_token}/edit"
        expect(response).to be_successful
      end
    end    

    describe "POST /create" do
      context 'with valid parameters' do
        it "redirects to the created app" do
          post "/apps", params: {app: valid_attributes}
          expect(response).to redirect_to("/apps/index")
        end
      end
    end

    describe "PUT #update" do

      context "with valid params" do
        let(:new_attributes) do
          {
            body: 'club'
          }
        end

        it "updates the requested post" do
          app= App.create! valid_attributes
          patch "/apps/#{app.access_token}", params: {body: new_attributes }
          post.reload
          expect(post.body).to eq('club')
        end

        it "redirects to the post" do
          app= App.create! valid_attributes
          patch "/apps/#{app.access_token}", params: {body: new_attributes }
          expect(response).to redirect_to("apps/index")
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          app= App.create! valid_attributes
          patch "/apps/#{app.access_token}", params: {body: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end

end
