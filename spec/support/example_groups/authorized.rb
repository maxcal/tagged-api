# Oauth token auth mixin for integration specs
module AuthorizedExampleGroup
  extend ActiveSupport::Concern
  included do
    let!(:access_token) do |ex|
      create(:access_token, resource_owner_id: user.id ).token if ex.metadata[:access_token]
    end
  end

  RSpec.configure do |config|
    config.include self, type: :request
  end
end
