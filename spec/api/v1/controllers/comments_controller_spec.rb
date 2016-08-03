require 'rails_helper'
include RandomData

RSpec.describe Api::V1::CommentsController, type: :controller do
  let(:my_user) { User.create!(name: 'Bloccit user', email: 'user@blocit.com', password: 'helloworld') }
  let(:other_user) { User.create!(name: RandomData.random_name, email: RandomData.random_email, password: 'helloworld', role: :member) }
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: my_user) }
  let(:my_comment) { Comment.create!(body: RandomData.random_sentence, post: my_post, user: my_user) }

  context 'unauthenticated user' do
    it "GET index returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "GET show returns http success" do
      get :show, id: my_comment.id
      expect(response).to have_http_status(:success)
    end

    it "GET show returns comment" do
      get :show, id: my_comment.id
      response_hash = JSON.parse response.body
      expect(response_hash['id']).to eq my_comment.id
      expect(response_hash['body']).to eq my_comment.body
    end
  end

  context "unauthorized user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::
              Token.encode_credentials(my_user.auth_token)
    end
    it "GET index returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "GET show returns http success" do
      get :show, id: my_comment.id
      expect(response).to have_http_status(:success)
    end

    it "GET show returns comment" do
      get :show, id: my_comment.id
      response_hash = JSON.parse response.body
      expect(response_hash['id']).to eq my_comment.id
      expect(response_hash['body']).to eq my_comment.body
    end
  end
end
