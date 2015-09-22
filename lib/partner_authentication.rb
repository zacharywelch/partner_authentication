module PartnerAuthentication
  extend ActiveSupport::Concern

  included do
    before_filter :authenticate
  end
  
  private
  
  def authenticate
    key, token = token_params_from(request.authorization)
    api_key = ApiKey.authenticate(key, token)
    head :unauthorized unless api_key and api_key.authorized?(request.remote_ip)
  end

  def token_params_from(auth)
    auth.sub(/^Partner /, '').split(/\s*:\s*/) if auth
  end
end

ActionController::Base.send :include, PartnerAuthentication

if defined? ActionController::API
  ActionController::API.send :include, PartnerAuthentication
end
