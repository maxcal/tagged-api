require 'rails_helper'

describe 'Doorkeeper tokens', type: :request do

  let(:user) { create(:user) }

  describe 'POST /oauth/token' do

    let(:params) {
      {
        grant_type: "password",
        username:   user.email,
        password:   "p4ssword",
        format: :json
      }
    }

    context 'with valid credentials' do

      before { post '/oauth/token', params }

      it 'does something' do
        expect(response.body).to eq ''
      end

    end

  end

  describe 'POST /oauth/revoke' do
  end
end
