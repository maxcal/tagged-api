require "application_responder"

class Tagged::ApplicationController < ActionController::Base

  INDIVIDUAL_ACTIONS = [:show, :edit, :destroy, :update]
  COLLECTION_ACTIONS = [:index, :create, :new]
  include ActionController::ImplicitRender
  include ActionController::Flash

  self.responder = ApplicationResponder
  respond_to :json, :html
end
