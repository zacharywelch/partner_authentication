require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  fixtures :api_keys

  test "responds to attributes" do
    key = ApiKey.new
    assert_respond_to key, :key
    assert_respond_to key, :token
  end

  test ".authenticate returns api key if found" do
    key = api_keys(:one)
    assert ApiKey.authenticate(key.key, key.token)
  end

  test ".authenticate returns nil if api key not found" do
    assert_not ApiKey.authenticate("missing", "missing")
  end
end
