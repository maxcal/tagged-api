FactoryGirl.define do
  factory :access_token, :class => 'Doorkeeper::AccessToken' do
    association :application
  end
end
