require 'rails_helper'

RSpec.describe 'Doorkeeper applications', type: :request do
  describe 'GET /oauth/applications' do
    before { get '/oauth/applications' }
    it { should redirect_to root_path }
  end
end
