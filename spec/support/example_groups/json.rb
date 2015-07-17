# Oauth token auth mixin for integration specs
module JSONExampleGroup
  extend ActiveSupport::Concern
  included do
    let(:json) do
       JSON.parse(response.body, symbolize_names: true) unless response.body.empty?
    end
  end
  RSpec.configure do |config|
    config.include self, type: :request
  end
end
