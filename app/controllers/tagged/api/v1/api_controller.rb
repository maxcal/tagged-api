require "application_responder"
module Tagged
  class Api::V1::APIController < ActionController::API

    INDIVIDUAL_ACTIONS = [:show, :edit, :destroy, :update]
    COLLECTION_ACTIONS = [:index, :create, :new]
    include ActionController::ImplicitRender

    self.responder = ApplicationResponder
    respond_to :json

    before_filter :set_default_response_format

    private
    def set_default_response_format
      request.format = :json
    end
  end
end
