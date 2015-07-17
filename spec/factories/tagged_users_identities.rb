FactoryGirl.define do
  factory :tagged_users_identity, :class => 'Tagged::Users::Identity' do
    user nil
password_digest "MyString"
  end

end
