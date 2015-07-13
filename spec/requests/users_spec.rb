require 'rails_helper'

RSpec.describe "User API", :type => :request do

  let(:user) { create(:user) }
  subject { response }
  let(:json) { JSON.parse(response.body, symbolize_names: true) unless response.body.empty? }
  let(:valid_attributes) { attributes_for(:user) }
  let(:invalid_attributes) { { email: 'sdfsfdsf' } }

  RSpec.shared_examples 'a JsonApi representation of a user' do |key|
    subject { key ? json[:data].try(key) : json[:data] }
    its([:id]){ should eq user.id.to_s }
    its([:type]){ should eq "tagged_users" }
    its([:attributes]){ should include(
      email: user.email
    )}
  end

  describe 'GET /api/v1/users/:id' do
    before { get "/api/v1/users/#{user.id}" }
    it { should have_http_status :ok }
    it_behaves_like 'a JsonApi representation of a user'
  end

  describe 'GET /api/v1/users' do
    before { user; get "/api/v1/users" }
    it { should have_http_status :ok }
    it 'returns an array of users' do
      expect(json[:data]).to be_a_kind_of Array
    end
    it_behaves_like 'a JsonApi representation of a user', :first
  end

  describe 'POST /api/v1/users' do
    let(:user) { assigns(:user) }
    let(:payload) do |ex|
      {
        data: {
          type: 'tagged_users',
          attributes: ex.metadata[:valid] ? valid_attributes : invalid_attributes
        }
      }
    end
    let(:action){ post '/api/v1/users', payload }
    before { |ex| action unless ex.metadata[:skip_action] }

    context 'with valid input', valid: true do
      it 'creates a user', skip_action: true do
        expect {
          action
        }.to change(Tagged::User, :count).by(+1)
      end
      it { should have_http_status :created }
      it_behaves_like 'a JsonApi representation of a user'
    end

    context 'with invalid input' do
      it 'does not creata a user', skip_action: true do
        expect {
          action
        }.to_not change(Tagged::User, :count)
      end
      it { should have_http_status :unprocessable_entity }
      it 'does not include data' do
        expect(json).to_not have_key :data
      end
      describe 'errors' do
        subject { json[:errors] }
        it { should have_key :email }
      end
    end
  end

  describe 'PATCH /api/v1/users/:id' do
    let(:valid_attributes) { { email: 'new_email@example.com' } }
    let(:invalid_attributes) { { email: 'xcvxcv-.sd,fdpkdkhd' } }
    let(:payload) do |ex|
      {
        data: {
          type: 'tagged_users',
          id: user.id,
          attributes: ex.metadata[:valid] ? valid_attributes : invalid_attributes
        }
      }
    end
    before { patch "/api/v1/users/#{user.id}", payload }

    context 'with valid input', valid: true do
      it { should have_http_status :no_content }
      it 'updates the user' do
        expect(user.reload.email).to eq valid_attributes[:email]
      end
    end

    context 'with invalid input' do
      it { should have_http_status :unprocessable_entity }
      it 'does not include data' do
        expect(json).to_not have_key :data
      end
      it 'does not update the user' do
        expect(user.reload.email).to_not eq invalid_attributes[:email]
      end
      describe 'errors' do
        subject { json[:errors] }
        it { should have_key :email }
      end
    end
  end

  describe 'DELETE /api/v1/users/:id' do
    let!(:user) { create(:user) }
    let(:action) { delete "/api/v1/users/#{user.id}" }
    before { |ex| action unless ex.metadata[:skip_action] }

    it 'destroys the user', skip_action: true do
      expect {
         action
      }.to change(Tagged::User, :count).by(-1)
    end
    it { should have_http_status :no_content }
  end
end
