# http://benediktdeicke.com/2013/01/custom-rspec-example-groups/
require 'factory_girl'

module SerializerExampleGroup

  extend ActiveSupport::Concern

  included do
    let(:resource_name) do
      described_class.name.demodulize.underscore[0..-12].to_sym
    end
    let(:resource) { build_stubbed resource_name }
    let(:serializer) { described_class.new(resource) }
    subject { serializer.serializable_hash.with_indifferent_access }
  end

  RSpec.configure do |config|
    config.include self,
      type: :serializer,
      file_path: %r(spec/serializers)
  end

end
