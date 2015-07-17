FactoryGirl.define do
  factory :application, :class => 'Doorkeeper::Application' do
    name 'TestApp'
    redirect_uri "https://example.com"
  end
end
