require 'rails_helper'
RSpec.describe Api::V1::BaseController, type: :controller do
  let(:my_user){ User.create!(name: 'Bloccit User', email: 'user@bloccit.com', password: 'password') }

  context 'authorized user' do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
      controller.authenticate_user
    end

    describe '#authenticate_user' do
      it 'finds a user by their aunthentication token' do
        expect(assigns(:current_user)).to eq(my_user)
      end
    end
  end
end