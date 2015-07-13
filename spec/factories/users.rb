require 'ffaker'

FactoryGirl.define do
  factory :user, :class => 'Tagged::User' do
    email FFaker::Internet.safe_email
  end
end
