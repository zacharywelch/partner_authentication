require "application_responder"

class ApplicationController < ActionController::Base
  include ActionController::ImplicitRender
  self.responder = ApplicationResponder
  respond_to :json
end
