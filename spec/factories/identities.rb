FactoryGirl.define do
  factory :identity, :class => 'Tagged::Users::Identity' do
    user nil
    password "p4ssword"
    password_confirmation "p4ssword"
  end
end
