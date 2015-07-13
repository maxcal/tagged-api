require 'rails_helper'
require 'support/example_groups/serializers'

describe Tagged::UserSerializer do
  it { should have_key :id }
  it { should have_key :email }
  it { should have_key :created_at }
  it { should have_key :updated_at }
end
