require 'rails_helper'
require 'json'

RSpec.describe 'Doorkeeper Password Grants', :type => :request do
  subject { response }
  let(:json) { JSON.parse(response.body, symbolize_names: true )}

  describe 'POST /oauth/token' do
    let(:user) { create(:user) }
    context 'with valid credentials' do
      before do
        post '/oauth/token', {
          grant_type: "password",
          username:   user.email,
          password:   'p4ssword'
        }
      end
      it 'should return an auth token' do
        expect(json).to have_key :access_token
      end
      it { should have_http_status :ok }
    end

    context 'with invalid credentials' do
      before do
        post '/oauth/token', {
          grant_type: "password",
          username:   user.email,
          password:   'wrong password'
        }
      end
      it 'should not return an auth token' do
        expect(json).to_not have_key :access_token
      end
      it 'should return an invalid_grant error' do
        expect(json[:error]).to eq 'invalid_grant'
      end
      it { should have_http_status :unauthorized }
    end
  end
end
