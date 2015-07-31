require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  fixtures :api_keys
  fixtures :authorized_ips

  test "responds to attributes" do
    key = ApiKey.new
    assert_respond_to key, :key
    assert_respond_to key, :token
    assert_respond_to key, :authorized_ips
  end

  test "#authorized? is true when ip is authorized" do
    key = api_keys(:one)
    assert key.authorized?("127.0.0.1")
  end

  test "#authorized? is false when ip is not authorized" do
    key = api_keys(:one)
    assert_not key.authorized?("127.0.0.0")
  end

  test "#authorized? is true when ip is within range" do
    key = api_keys(:key_with_range)
    assert key.authorized?("127.0.0.1")
    assert key.authorized?("127.5.0.5")
  end

  test "#authorized? is false when ip is outside of range" do
    key = api_keys(:key_with_range)
    assert_not key.authorized?("128.0.0.1")
    assert_not key.authorized?("127.0.1.1")
  end

  test ".authenticate returns api key if found" do
    key = api_keys(:one)
    assert ApiKey.authenticate(key.key, key.token)
  end

  test ".authenticate returns nil if api key not found" do
    assert_not ApiKey.authenticate("missing", "missing")
  end
end
