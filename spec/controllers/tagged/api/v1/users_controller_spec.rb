require 'rails_helper'

RSpec.describe Tagged::Api::V1::UsersController do

  let(:user) { create(:user) }
  let(:valid_attributes) { attributes_for(:user) }
  let(:invalid_attributes) { { email: 'sdfsfdsf' } }
end
