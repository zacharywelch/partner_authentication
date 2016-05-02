require 'rails_helper'

shared_context :authorization do
  
  let(:auth_token) { { 'Authorization' => 'Partner foo:bar' } }
  
  before do
    key = ApiKey.create key: 'foo', token: 'bar'
    key.authorized_ips.create ip_address: "127.0.0.1"
  end
end

shared_examples 'authorization' do |path, options = {}|

  before do
    method = options[:method] || :get
    send method, "#{path}"
  end

  it 'authorizes token' do
    expect(response.status).to be 401
  end
end
