require 'rails_helper'

RSpec.describe Tagged::Users::Identity, type: :model do
  it { should have_secure_password }
  it { should belong_to :user }
end
